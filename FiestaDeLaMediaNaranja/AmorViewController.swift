//
//  AmorViewController.swift
//  FiestaDeLaMediaNaranja
//
//  Created by Nacho on 27/11/16.
//  Copyright © 2016 UPM. All rights reserved.
//

import UIKit

class AmorViewController: UIViewController {
    
    @IBOutlet weak var aceptar: UIButton!
    @IBOutlet weak var loveDate: UIDatePicker!
    
    var fechaAmor = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        defaults.set(loveDate.description, forKey: "amor")
        
        // Do any additional setup after loading the view.
        loveDate.setDate(fechaAmor as Date, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    @IBAction func changeLoveDate(_ sender: UIDatePicker) {
        if !fechaValida(date: sender.date as NSDate){
            print("Fecha no válida!")
        }
        self.fechaAmor = sender.date as NSDate
    }
    
    func fechaValida(date: NSDate) -> Bool {
        let today = NSDate()
        if date.laterDate(today as Date) == date as Date {
            
            let alert = UIAlertController(title: "Fecha no valida", message: "ERROR: No puedes haberte enamorado más tarde que la fecha actual ;)", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(
                UIAlertAction(title: "Aceptar",
                              style: UIAlertActionStyle.default,
                              handler: {(alert :UIAlertAction!) in
                                self.loveDate.setDate(NSDate() as Date, animated: true)
                }))
            
            present(alert, animated: true, completion: nil)
            return false
        }
        
        return true
    }

}
