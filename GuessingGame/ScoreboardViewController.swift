//
//  ScoreboardViewController.swift
//  GuessingGame
//
//  Created by user191610 on 2/24/21.
//

import UIKit

class ScoreboardViewController: UIViewController {
    
    var w: Int = 0
    var l: Int = 0
    
    
    @IBOutlet weak var attemptswon: UILabel!
    
    @IBOutlet weak var attemptslost: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.attemptswon.text = "\(w)"
        self.attemptslost.text = "\(l)"
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
