//
//  ViewController.swift
//  Actividad1-JM
//
//  Created by JUAN MARÍA JUSUE ROYAN on 14/3/17.
//  Copyright © 2017 JUAN MARÍA JUSUE ROYAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var passTextField: UITextField?
    @IBOutlet weak var lblError: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.c
        lblError?.text = ""
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg-colored.png")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func LoginButton() {
        if (nameTextField?.text == "" && passTextField?.text == ""){
            lblError?.text="Introduce un usuario y una contraseña"
        }
        
        if (nameTextField?.text==DataHolder.sharedInstance.Usuario) && (passTextField?.text==DataHolder.sharedInstance.Pass){
             self.performSegue(withIdentifier:"tran1", sender: self)
        }
        else{
            lblError?.text = "Usuario o contraseña no existe"
        }
    }
   

    
    
}
