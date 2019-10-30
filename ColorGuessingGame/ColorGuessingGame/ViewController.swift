//
//  ViewController.swift
//  ColorGuessingGame
//
//  Created by Brendon Cecilio on 10/29/19.
//  Copyright © 2019 Brendon Cecilio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayColor: UIView!
    @IBOutlet weak var ColorButtonRed: UIButton!
    @IBOutlet weak var colorButtonGreen: UIButton!
    @IBOutlet weak var colorButtonBlue: UIButton!
    @IBOutlet weak var playAgainIfLose: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    
    var score = 0
    var highScore = 0
    var hue: CGFloat = 0
    var saturation: CGFloat = 0
    var brightness: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayColor.backgroundColor = generateRandomColor()
        // Do any additional setup after loading the view.
        
    }
    
    // true random color function
    func generateRandomColor() -> UIColor {
        hue = CGFloat.random(in: 0...1) / 256 // use 256 to get full range from 0.0 to 1.0
        saturation = CGFloat.random(in: 0.5...1) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        brightness = CGFloat.random(in: 0.5...1) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        let randomColor = [hue, saturation, brightness]
        let randomUIColor = randomColor.max
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        displayLabel.text = "Guess the color in the mixed color above!"
        displayColor.backgroundColor = generateRandomColor()
    }
    
    
    // TODO: put hue, saturation, and brightness in an array and return greatest value and compare that value in if statement.
    // use greater than or less than operators
    
    @IBAction func colorButton(_ sender: UIButton) {
        if sender.backgroundColor != generateRandomColor(){
            displayLabel.text = "Wrong! Your score is \(score) Do you want to play again?"
//            ColorButtonRed.isEnabled = false
//            colorButtonGreen.isEnabled = false
//            colorButtonBlue.isEnabled = false
        } else if sender.backgroundColor == generateRandomColor() {
            score += 1
            displayLabel.text = "Correct! Keep Going! Your score is \(score)"
            displayColor.backgroundColor = generateRandomColor()
        }
    }
    
    
}

