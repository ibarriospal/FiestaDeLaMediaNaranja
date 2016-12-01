//
//  ResultadosViewController.swift
//  FiestaDeLaMediaNaranja
//
//  Created by Nacho on 27/11/16.
//  Copyright © 2016 UPM. All rights reserved.
//

import UIKit

class ResultadosViewController: UIViewController {
    @IBOutlet weak var resultadoLabel: UILabel!

    var nac = NSDate()
    var amor = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Obtenemos los datos de view controller
    @IBAction func calculateResults(_segue: UIStoryboardSegue) {
        if let vc = _segue.source as? ViewController {
            nac = vc.nacimiento
            amor = vc.amor
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Resultados" {
            if let vc = segue.destination as? ViewController {
                resultadoLabel.text = vc.amorDate.text
            }
        }
        else{
            return
        }
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
