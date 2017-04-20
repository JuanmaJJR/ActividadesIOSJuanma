//
//  CVCMiCelda2.swift
//  Actividad1-JM
//
//  Created by JUAN MARÍA JUSUE ROYAN on 28/3/17.
//  Copyright © 2017 JUAN MARÍA JUSUE ROYAN. All rights reserved.
//

import UIKit

class CVCMiCelda2: UICollectionViewCell {
    @IBOutlet var imgvMain:UIImageView?
    @IBOutlet var lblNombre:UILabel?
    
    func descargarImagen(ruta:String){
        // Create a reference to the file you want to download
        let islandRef = DataHolder.sharedInstance.firStorageRef?.child(ruta)//storageRef.child(ruta)
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef?.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
            if (error != nil) {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                // ... let islandImage: UIImage! = UIImage(data: data!)
                let image = UIImage(data: data!)
                self.imgvMain?.image=image
            }
        }
    }

    
}
