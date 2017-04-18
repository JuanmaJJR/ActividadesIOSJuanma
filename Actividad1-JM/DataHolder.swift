//
//  DataHolder.swift
//  Actividad1-JM
//
//  Created by JUAN MARÍA JUSUE ROYAN on 28/3/17.
//  Copyright © 2017 JUAN MARÍA JUSUE ROYAN. All rights reserved.
//

import UIKit

class DataHolder: NSObject {
    static let sharedInstance:DataHolder=DataHolder()
    
    var Usuario:String?
    var Pass:String?
}
