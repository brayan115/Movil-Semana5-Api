//
//  ViewController.swift
//  api-semana5
//
//  Created by mbtec22 on 9/18/21.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModelModeloPost  = ViewModelModeloPost()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Esta funcion se encarga de activar la peticion
        configureView()
        // Esta funciones ejecutra a refreshData para poder obtener la data que se guardo en la variable dataArrayHistoryPost
        bind()
        // Prindata itera al arregle dataArrayHistoryPost para poder leer cada valor00
        printData()
    }
    func configureView() {
        // aca ejecuta la funcion que hace el llamado al urlAPI
        viewModelModeloPost.getDataModeloPost()
    }
    func printData() {
        for post in viewModelModeloPost.dataArrayModeloPost {
            print("Código de País : \(post.iso_3166_1)")
            print("Nombre en Inglés: \(post.english_name)")
            print("Nombre nativo: \(post.native_name)")
            print("-----------------------------------")
            
        }
    }
    func bind() {
        viewModelModeloPost.refreshData = { [weak self] () in
            DispatchQueue.main.async {

                self?.printData()
            }
        }
    }


}

