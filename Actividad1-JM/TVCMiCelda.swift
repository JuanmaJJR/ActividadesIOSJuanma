//
//  TVCMiCelda.swift
//  Actividad1-JM
//
//  Created by JUAN MARÍA JUSUE ROYAN on 22/3/17.
//  Copyright © 2017 JUAN MARÍA JUSUE ROYAN. All rights reserved.
//

import UIKit

class TVCMiCelda: UITableViewCell {
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var imagn:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
