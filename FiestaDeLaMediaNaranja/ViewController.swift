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
    
    var today = NSDate()
    var formatter:DateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        formatter.dateStyle = DateFormatter.Style.long
        nacimientoDate.text = formatter.string(from: today as Date)
        amorDate.text = formatter.string(from: today as Date)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //validarFechas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

