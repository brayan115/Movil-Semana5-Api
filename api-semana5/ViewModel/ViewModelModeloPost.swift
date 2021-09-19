//
//  ViewModelModeloPost.swift
//  api-semana5
//
//  Created by mbtec22 on 9/19/21.
//

import Foundation

class ViewModelModeloPost{
    
    let urlAPI = "https://api.themoviedb.org/3/configuration/countries?api_key=42ab8c5b42b79b97fff65b9f81be07d2"
    
    var refreshData = {
        () -> () in
    }
    
    var dataArrayModeloPost : [ModeloPost] = []{
        didSet {
            refreshData()
        }
    }
    func getDataModeloPost()   {
        guard let url = URL(string: urlAPI) else {return}
        
        URLSession.shared.dataTask(with: url){
            (data, response, error) in
            guard let dataJSON = data else { return }
                       
                       // Me toca formatear data a un JSON
                       // Em swift JSONDecoder()
                       
                       // Este do catch es el equivalente try catch
                       do {
                           // En caso todo este ok aca debo hacer la serializacion
                           let decoder = JSONDecoder()
                        self.dataArrayModeloPost = try decoder.decode([ModeloPost].self, from: dataJSON)
                    
                    } catch let error as NSError {
                        // NSError es una clase de Swift la cual contiene la prevencion de
                        // errores
                        print(error.localizedDescription)
                    }
        }.resume()
    }
}
