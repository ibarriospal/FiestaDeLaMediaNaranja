//
//  ViewController.swift
//  FiestaDeLaMediaNaranja
//
//  Created by Nacho on 27/11/16.
//  Copyright © 2016 UPM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fechaAmor: UIDatePicker!
    @IBOutlet weak var fechaNacimiento: UIDatePicker!
    
    var today = NSDate()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeLoveDate(_ sender: UIDatePicker) {
        if !fechaValida(fecha: sender.date as NSDate){
            print("Fecha no válida!")
        }
        fechaAmor = sender
    }
    func fechaValida(fecha: NSDate) -> Bool {
        let nacimiento = fechaNacimiento
        if fecha.earlierDate((nacimiento?.date)! as Date) == fecha as Date {
            // Creamos un UIAlertController:
            let alert = UIAlertController(title: "Fecha no válida", message: "No puedes haberte enamorado antes de nacer ;)",
                                          preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default,handler: {(alert :UIAlertAction!) in
                self.fechaAmor.date = self.today as Date
            }))
            
            // Presentar el Alert Controller:
            present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }


}

