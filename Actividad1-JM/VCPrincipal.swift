//
//  VCPrincipal.swift
//  Actividad1-JM
//
//  Created by JUAN MARÍA JUSUE ROYAN on 22/3/17.
//  Copyright © 2017 JUAN MARÍA JUSUE ROYAN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class VCPrincipal: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var tbMiTable:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let refHandle =
            DataHolder.sharedInstance.firDataBaseRef.child("Usuarios").observe(FIRDataEventType.value, with: { (snapshot) in
                var arTemp=snapshot.value as? Array<AnyObject>
                
                if(DataHolder.sharedInstance.arUsuarios==nil){
                    DataHolder.sharedInstance.arUsuarios=Array<Usuario>()
                }
                
                for co in arTemp! as [AnyObject]{
                    
                    let usuarioi=Usuario(valores: co as! [String:AnyObject])
                    DataHolder.sharedInstance.arUsuarios?.append(usuarioi)
                }
                
                self.tbMiTable?.reloadData()
                
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(DataHolder.sharedInstance.arUsuarios==nil){
            return 0
        }
        else{
        return (DataHolder.sharedInstance.arUsuarios?.count)!
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCMiCelda = tableView.dequeueReusableCell(withIdentifier: "micelda1") as! TVCMiCelda
        
        let usuarioi:Usuario = DataHolder.sharedInstance.arUsuarios![indexPath.row]
        
        cell.lblNombre?.text=usuarioi.sNombre
        
        //cell.lblNombre?.text=""
        if(indexPath.row==0){
            cell.lblNombre?.text="Swift"
            cell.imagn?.image=UIImage(named:"Image.png")
        }
        if(indexPath.row==1){
            cell.lblNombre?.text="Objective c"
            cell.imagn?.image=UIImage(named:"Image-1.png")
        }
        if(indexPath.row==2){
            cell.lblNombre?.text="Java"
            cell.imagn?.image=UIImage(named:"descarga.png")
        }
        if(indexPath.row==3){
            cell.lblNombre?.text="c++"
            cell.imagn?.image=UIImage(named:"c.png")
        }
        if(indexPath.row==4){
            cell.lblNombre?.text="Scala"
            cell.imagn?.image=UIImage(named:"scala-logo.png")
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
