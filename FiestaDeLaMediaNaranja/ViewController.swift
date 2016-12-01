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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    

}

