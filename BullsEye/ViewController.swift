//
//  ViewController.swift
//  BullsEye
//
//  Created by NguyenHung on 2/7/17.
//  Copyright © 2017 NguyenHung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var targetValue: Int = 0
    var currentValue: Int = 50
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
        
        
//        currentValue = lroundf(slider.value) - Duoc thay the bang startNewRound
//        targetValue = 1 + Int(arc4random_uniform(100)) - Duoc thay the bang startNewRound
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showAlert() {
        
        var difference: Int
        if currentValue > targetValue {
            difference = currentValue - targetValue
        } else if targetValue > currentValue {
            difference = targetValue - currentValue
        } else {
            difference = 0
        }
        
        let message = "The value of the slider is: \(currentValue)"
                         + "\nThe target Value is: \(targetValue)"
                         + "\nThe difference is: \(difference)"
        
        
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        updateLabels()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

}
