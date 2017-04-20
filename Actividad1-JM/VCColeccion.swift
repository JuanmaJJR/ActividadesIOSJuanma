//
//  VCColeccion.swift
//  Actividad1-JM
//
//  Created by JUAN MARÍA JUSUE ROYAN on 28/3/17.
//  Copyright © 2017 JUAN MARÍA JUSUE ROYAN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class VCColeccion: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet var colPrincipal:UICollectionView?
    @IBOutlet var imgvPrincipal:UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refHandle =
            DataHolder.sharedInstance.firDataBaseRef.child("Usuarios").observe(FIRDataEventType.value, with: { (snapshot) in
                var arTemp=snapshot.value as? Array<AnyObject>
                
                //if(DataHolder.sharedInstance.arUsuarios==nil){
                DataHolder.sharedInstance.arUsuarios=Array<Usuario>()
                //}
                
                for co in arTemp! as [AnyObject]{
                    
                    let usuarioi=Usuario(valores: co as! [String:AnyObject])
                    DataHolder.sharedInstance.arUsuarios?.append(usuarioi)
                }
                
                self.colPrincipal?.reloadData()
                
                //let usuario0=Usuario(valores: arTemp?[0] as! [String : AnyObject])
                //let usuario0=arTemp?[0] as? [String:AnyObject]
                //print("EL COCHE EN LA POSICION 0 ES:",usuario0.sNombre!)
                
                //let postDict = snapshot.value as? [String:AnyObject] ?? [:]
                
            })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(DataHolder.sharedInstance.arUsuarios==nil){
            return 0
        }
        else{
            return (DataHolder.sharedInstance.arUsuarios?.count)!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCMiCelda2=collectionView.dequeueReusableCell(withReuseIdentifier: "micelda2",for:indexPath) as! CVCMiCelda2
        
        let usuarioi:Usuario = DataHolder.sharedInstance.arUsuarios![indexPath.row]
        
        cell.lblNombre?.text=usuarioi.sNombre
        cell.descargarImagen(ruta: usuarioi.sRutaImagenP!)
        
        /*if(indexPath.row==0){
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
        }*/

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
