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
        
      return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    
    @IBAction func colorButton(_ sender: UIButton) {
        if sender.backgroundColor != generateRandomColor(){
            displayLabel.text = "Wrong! Do you want to play again?"
        } else if sender.backgroundColor == generateRandomColor() {
            displayLabel.text = "Correct! Keep Going!"
        }
    }
    
    
}

