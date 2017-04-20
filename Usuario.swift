//
//  Usuario.swift
//  Actividad1-JM
//
//  Created by JUAN MARÍA JUSUE ROYAN on 20/4/17.
//  Copyright © 2017 JUAN MARÍA JUSUE ROYAN. All rights reserved.
//

import UIKit

class Usuario: NSObject {
    
    var sNombre:String?
    var sApellidos:String?
    
     init(valores:[String:AnyObject]) {
        sNombre=valores["Nombre"] as? String
        sApellidos=valores["Apellidos"] as? String
    }

}
