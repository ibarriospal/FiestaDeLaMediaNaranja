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
    var formatter:DateFormatter = DateFormatter()
    var separacion = Int()
    var r = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calcular()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func calcular(){
        let calendar = Calendar.current
        let componente = Calendar.Component.day
        let flags = Set<Calendar.Component>([.day])
        separacion = calendar.dateComponents(flags, from: nac as Date, to: amor as Date).day!
        let resultado = calendar.date(byAdding: componente, value: separacion, to: amor as Date)
        formatter.dateStyle = DateFormatter.Style.long
        r = formatter.string(from: resultado! as Date)
        resultadoLabel.text = r
        
        let defaults = UserDefaults.standard
        defaults.set(nac, forKey: "nacimiento")
        defaults.set(amor, forKey: "amor")
        defaults.synchronize()
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
