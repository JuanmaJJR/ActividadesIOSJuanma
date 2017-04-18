//
//  VCColeccion.swift
//  Actividad1-JM
//
//  Created by JUAN MARÍA JUSUE ROYAN on 28/3/17.
//  Copyright © 2017 JUAN MARÍA JUSUE ROYAN. All rights reserved.
//

import UIKit

class VCColeccion: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet var colPrincipal:UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCMiCelda2=collectionView.dequeueReusableCell(withReuseIdentifier: "micelda2",for:indexPath) as! CVCMiCelda2
        if(indexPath.row==0){
            cell.lblNombre?.text="Swift"
            cell.imgvMain?.image=UIImage(named:"Image.png")
        }
        if(indexPath.row==1){
            cell.lblNombre?.text="Objective c"
            cell.imgvMain?.image=UIImage(named:"Image-1.png")
        }
        if(indexPath.row==2){
            cell.lblNombre?.text="Java"
            cell.imgvMain?.image=UIImage(named:"descarga.png")
        }
        if(indexPath.row==3){
            
            cell.imgvMain?.image=UIImage(named:"c.png")
            cell.lblNombre?.text="c++"
        }
        if(indexPath.row==4){
            cell.lblNombre?.text="Scala"
            cell.imgvMain?.image=UIImage(named:"scala-logo.png")
        }

        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
