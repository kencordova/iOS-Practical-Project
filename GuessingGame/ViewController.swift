//
//  ViewController.swift
//  GuessingGame
//
//  Created by user191610 on 2/24/21.
//

import UIKit

class ViewController: UIViewController {
    
    var wins = 0
    var losses = 0
    var attempts = 5
    var RandomNumber = Int(arc4random_uniform(26))
        
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var off: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func showAlert () {
        
        let alert = UIAlertController(title: "Result", message: "You guessed right", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Play again", style: .default, handler: {_ in
            self.NewGame()
        }))
        
        alert.addAction(UIAlertAction(title: "Show scoreboard", style: .default, handler: {_ in
            self.goToScoreboard()
        }));
        
        present(alert, animated: true)
    }
    
    func showAlert2 () {
        
        let alert = UIAlertController(title: "Result", message: "You lost the game, Correct answer is \(RandomNumber)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Play again", style: .default, handler: {_ in
            self.NewGame()
        }))
        
        alert.addAction(UIAlertAction(title: "Show scoreboard", style: .default, handler: {_ in
            self.goToScoreboard()
        }));
        present(alert, animated: true, completion: nil)
        
    }
    
    func goToScoreboard() {

        self.NewGame()
        
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

                          //create instant of the destination ViewController
                          let scoreboardVC = storyboard.instantiateViewController(identifier: "ScoreboardVC") as! ScoreboardViewController
        
        scoreboardVC.w = wins;
        scoreboardVC.l = losses;
                          //add the new screen/VC on the Navigation Stack
                          self.navigationController?.pushViewController(scoreboardVC, animated: true)
            
    }
    
   func NewGame() {
    attempts = 5
    

    
   }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        if (Int( self.answer.text!)! == RandomNumber ) {
            
            wins += 1
            self.showAlert()
        }
        
        if (Int( self.answer.text!) ?? 0 > RandomNumber ) {
            attempts -= 1;
            self.off.text = "\(self.answer.text!) is too high \(attempts) attempts left"
        
        }
        
        if (Int ( self.answer.text!) ?? 0 < RandomNumber) {
            attempts -= 1;
            self.off.text = "\(self.answer.text!) is too low \(attempts) attempts left"
            
        }
        
        if attempts == 0 {
            
            losses += 1
            self.NewGame()
            self.showAlert2()
            
        }
        
    }


}

