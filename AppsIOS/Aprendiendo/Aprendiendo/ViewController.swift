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
    
    @IBOutlet weak var emailSwitch: UISwitch!
    
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
            
            if emailSwitch.isOn{
                //De esta manera guardamos valores con llave y valor en los UserDafaults.
                storage.set(email, forKey: emailkey)
            } else {
                storage.removeObject(forKey: emailkey)
            }
            performSegue(withIdentifier: "home_segue", sender: nil)
        } else {
            print("contraseña o cuenta invalida")
        }
        
    }

    private let emailkey = "email-key"
    //La linea de abajo nos va a dar acceso a los valores guardados en el telefono (dentro de la aplicacion)
    private let storage = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //De esta manera buscamos un string en los UserDefaults y lo asignamos
        if let storedEmail = storage.string(forKey: emailkey){
            emailTextField.text = storedEmail
            emailSwitch.isOn = true
        } else {
            emailSwitch.isOn = false
        }
    }


}

