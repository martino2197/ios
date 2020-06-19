//
//  ViewController.swift
//  Aprendiendo
//
//  Created by ana on 18/06/20.
//  Copyright © 2020 martin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Referencias UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextFIeld: UITextField!
    
    @IBAction func loginButtonAction() {
        //1. Obtener los valores de los TextField
        let email = emailTextField.text
        let password = passwordTextFIeld.text
        
        if email == "martino@gmail.com" && password == "1234" {
            print("Iniciando sesion")
            /*Utilizamos performSegue para movernos desde el flujo de nuestro
             Main.storyboard hacia el Home.storyboard, el primer parametro es
             el identificador del Segue que va al Storyboard Reference el cual
             conecta con Home.storyboard
             */
            performSegue(withIdentifier: "home_segue", sender: nil)
        } else {
            print("contraseña o cuenta invalida")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

