//
//  NacimientoViewController.swift
//  FiestaDeLaMediaNaranja
//
//  Created by Nacho on 27/11/16.
//  Copyright © 2016 UPM. All rights reserved.
//

import UIKit

class NacimientoViewController: UIViewController {

    @IBOutlet weak var nacimientoDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for:UIStoryboardSegue,sender:Any?)
    {
        
       /* let vista:ViewController = UIStoryboardSegue.destination as! ViewController
        vista.nacimientoDate.text = nacimientoDate.description
    */
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

}
