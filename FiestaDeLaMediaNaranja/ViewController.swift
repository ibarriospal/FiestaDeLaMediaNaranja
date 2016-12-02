//
//  ViewController.swift
//  FiestaDeLaMediaNaranja
//
//  Created by Nacho on 27/11/16.
//  Copyright © 2016 UPM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nacimientoDate: UILabel!
    @IBOutlet weak var amorDate: UILabel!
    
    var nacimiento = NSDate()
    var amor = NSDate()
    
    var today = NSDate()
    var formatter:DateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        if let nacimientoG = defaults.object(forKey: "nacimiento") as? NSDate {
            nacimiento = nacimientoG
            formatter.dateStyle = DateFormatter.Style.long
            nacimientoDate.text = formatter.string(from: nacimientoG as Date)
        }
        else {
            nacimientoDate.text = ""
        }
        if let amorG = defaults.object(forKey: "amor") as? NSDate {
            amor = amorG
            formatter.dateStyle = DateFormatter.Style.long
            amorDate.text = formatter.string(from: amorG as Date)
        }
        else {
            amorDate.text = ""
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fechasValidas()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Preparamos el segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Nacimiento") {
            if let vc = segue.destination as? NacimientoViewController {
                vc.fechaNacimiento = nacimiento
            }
        }
        else if (segue.identifier == "Amor") {
            if let vc = segue.destination as? AmorViewController{
                    vc.fechaAmor = amor
            }
        }
        else if (segue.identifier == "Resultado") {
            if let vc = segue.destination as? ResultadosViewController{
                if (amorDate.text! == "") || (nacimientoDate.text! == "") {
                    let alert = UIAlertController(title: "Error",
                                                  message: "ERROR: Te faltan introducir datos",
                                                  preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(
                        UIAlertAction(title: "Aceptar",
                                      style: UIAlertActionStyle.default,
                                      handler: {(alert :UIAlertAction!) in
                                        self.nacimientoDate.text = ""
                                        self.amorDate.text = ""
                        }))
                    
                    present(alert, animated: true, completion: nil)
                    return
                }
                vc.amor = amor
                vc.nac = nacimiento
            }
        }
        else {
            return
        }
    }

    //Obtenemos los datos de NacimientoViewController
    @IBAction func changeBorn(_segue: UIStoryboardSegue) {
        if let vc = _segue.source as? NacimientoViewController {
            nacimiento = vc.fechaNacimiento
            formatter.dateStyle = DateFormatter.Style.long
            nacimientoDate.text = formatter.string(from: nacimiento as Date)
            
        }
    }
    
    //Obtenemos los datos de AmorViewController
    @IBAction func changeLove(_segue: UIStoryboardSegue) {
        if let vc = _segue.source as? AmorViewController {
            amor = vc.fechaAmor
            formatter.dateStyle = DateFormatter.Style.long
            amorDate.text = formatter.string(from: amor as Date)
        }
    }
    
    
    func fechasValidas() {
        if nacimientoDate.text != "" && nacimientoDate.text != ""{
            if nacimiento.earlierDate(amor as Date)==amor as Date{
                
                let alert = UIAlertController(title: "Fecha no válida",
                                               message: "ERROR: No puedes haberte enamorado antes de nacer ;)",
                                               preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(
                    UIAlertAction(title: "Volver a introducir los datos",
                                  style: UIAlertActionStyle.default,
                                  handler: {(alert :UIAlertAction!) in
                                    self.nacimientoDate.text = ""
                                    self.amorDate.text = ""
                    }))

                present(alert, animated: true, completion: nil)
                return
            }
        }
    }
}

