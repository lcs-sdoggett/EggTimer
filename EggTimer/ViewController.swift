//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var secondsRemaining = 60
    
    var timer = Timer()

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTime[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updatedTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updatedTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
        
}
