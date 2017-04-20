//
//  VCMapa.swift
//  Actividad1-JM
//
//  Created by JUAN MARÍA JUSUE ROYAN on 20/4/17.
//  Copyright © 2017 JUAN MARÍA JUSUE ROYAN. All rights reserved.
//

import UIKit
import MapKit
import Firebase
import FirebaseStorage



class VCMapa: UIViewController, MKMapViewDelegate{
 @IBOutlet var miMapa:MKMapView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        miMapa?.showsUserLocation = true
        
        let refHandle =
            DataHolder.sharedInstance.firDataBaseRef.child("Usuarios").observe(FIRDataEventType.value, with: { (snapshot) in
                var arTemp=snapshot.value as? Array<AnyObject>
                
                //if(DataHolder.sharedInstance.arUsuarios==nil){
                DataHolder.sharedInstance.arUsuarios=Array<Usuario>()
                //}
                
                for co in arTemp! as [AnyObject]{
                    
                    let usuarioi=Usuario(valores: co as! [String:AnyObject])
                    DataHolder.sharedInstance.arUsuarios?.append(usuarioi)
                    var coordTemp:CLLocationCoordinate2D = CLLocationCoordinate2D()
                    coordTemp.latitude = usuarioi.fLat!
                    coordTemp.longitude = usuarioi.fLon!
                    self.agregarPin(coordenada: coordTemp, titulo: usuarioi.sNombre!)
                    
                }
                
                
            })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func agregarPin(coordenada:CLLocationCoordinate2D, titulo varTitulo:String){
        let annotation:MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = coordenada
        annotation.title = varTitulo
        miMapa?.addAnnotation(annotation)
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
