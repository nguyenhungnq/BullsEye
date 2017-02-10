//
//  ViewController.swift
//  BullsEye
//
//  Created by NguyenHung on 2/7/17.
//  Copyright © 2017 NguyenHung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var targetValue = 0
    var currentValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    func startNewRound() {
        
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
        
        
//        currentValue = lroundf(slider.value) - Duoc thay the bang startNewRound
//        targetValue = 1 + Int(arc4random_uniform(100)) - Duoc thay the bang startNewRound
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            points += 50
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You scored \(points) points"
        
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in
                                                                            self.startNewRound()
                                                                            self.updateLabels()
                                                                            })
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        updateLabels()
        
        
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }

}
