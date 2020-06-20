//
//  ViewController.swift
//  AprendiendoTablas
//
//  Created by ana on 19/06/20.
//  Copyright © 2020 martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK; - Referencia de la tabla
    
    @IBOutlet weak var tableView: UITableView!
    /*
        1. Implementar nuestro DataSource <- Interfaz
     */
    //El metodo viewDidLoad es parte del ciclo de vida de nuestras vistas,
    //todo lo que se ejecute dentro del metodo lo hara de manera segura,
    //cuando al usuario le este cargando la pantalla.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //asignando el self al tableView.data le estamos
        //diciendo a la tabla que nosotros le damos la
        //configuracion que hicimos en el extension.
        //NO OLVIDAR!!!
        tableView.dataSource = self
        
        /*Lo siguiente es Registrar a nuestra tabla que celda va a utilizar
        //El UITableViewCell es la celda por defecto en ios y especificamos el tipo con .self
        //Con "mi-celda" le estamos diciendo que use la celda UITableViewCell con el identificador "mi-celda", para cuando la intente construir abajo (en la extension) sepa cual utilizar con ese identificador*/
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mi-celda")
        
        //Para interactuar implementamos el delegate
        tableView.delegate = self
    }
}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    //Este metodo se va disparar cuando una celda sea seleccionada
    //el IndexPath es el objeto que nos va a decir en que indice se esta seleccionando la celda o si se esta renderizando si es el caso.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La celda #\(indexPath.row) fue seleccionada.")
    }
}
//implementamos la interfaz con la ayuda de una extension
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    //1. Numero de filas que tendra nuestra tabla.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    //2. Metodo para saber que celdas deben mostrarse.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mi-celda", for: indexPath)
        
        cell.textLabel?.text = "Soy la celda #\(indexPath.row)"
        return cell
    }
}
