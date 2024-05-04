//
//  StartViewController.swift
//  RockPaperScissorXIB
//
//  Created by Diplomado on 04/05/24.
//

import UIKit

class StartViewController: UIViewController {
    var customView: StartView {
        // casteando la vista para convertirla en el tipo de dato StartView
        return view as! StartView
    }
    
    override func loadView() {
        // llamando una instancia de la vista
        view = StartView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //connectStartView()
        // setBarButtonItemGroup()
    }
    
    private func connectStartView() {
        // toda esta linea es el equivalente a cuando se ligaban los botines con su accion en la interfaz grafica
    }
}

