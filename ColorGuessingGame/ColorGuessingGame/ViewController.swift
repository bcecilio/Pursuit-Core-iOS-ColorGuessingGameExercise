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
    @IBOutlet weak var colorButtonRed: UIButton!
    @IBOutlet weak var colorButtonGreen: UIButton!
    @IBOutlet weak var colorButtonBlue: UIButton!
    @IBOutlet weak var playAgainIfLose: UIButton!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var highScore: UILabel!
    
    
    var currentScore = 0
    var finalScore = 0
    var randomRed: CGFloat = 0.0
    var randomGreen: CGFloat = 0.0
    var randomBlue: CGFloat = 0.0
    var emptyColorArr = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomColor()
        // Do any additional setup after loading the view.
        
    }
    
    // true random color function
    func generateRandomColor() {
        randomRed = CGFloat.random(in: 0...1)
        randomGreen = CGFloat.random(in: 0...1)
        randomBlue = CGFloat.random(in: 0...1)
        
        let randomColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1) //3 properties
        
        displayColor.backgroundColor = randomColor
        
        emptyColorArr.append(randomRed)
        emptyColorArr.append(randomGreen)
        emptyColorArr.append(randomBlue)
        
    }
    
    
    @IBAction func playAgain(_ sender: UIButton) {
        displayLabel.text = "Guess the color in the mixed color above!"
        emptyColorArr = []
        generateRandomColor()
        currentScore = 0
        score.text = "Score: \(currentScore)"
        highScore.text = "HighScore: \(finalScore)"
        colorButtonBlue.isEnabled = true
        colorButtonRed.isEnabled = true
        colorButtonGreen.isEnabled = true
    }
    
    
    
    
    // TODO: put hue, saturation, and brightness in an array and return greatest value and compare that value in if statement.
    
    @IBAction func colorButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if emptyColorArr[0] == emptyColorArr.max() ?? 0.1{
                displayLabel.text = "Correct! Keep Going!"
                currentScore += 1
                score.text = "Score: \(currentScore)"
                emptyColorArr = []
                generateRandomColor()
            } else {
                displayLabel.text = "Wrong. Do you want to play again?"
                finalScore = currentScore
                highScore.text = "HighScore: \(currentScore)"
                colorButtonBlue.isEnabled = false
                colorButtonRed.isEnabled = false
                colorButtonGreen.isEnabled = false
            }
        case 1:
            if emptyColorArr[1] == emptyColorArr.max() ?? 0.1{
                displayLabel.text = "Correct! Keep Going!"
                currentScore += 1
                score.text = "Score: \(currentScore)"
                emptyColorArr = []
                generateRandomColor()
            } else {
                displayLabel.text = "Wrong. Do you want to play again?"
                finalScore = currentScore
                highScore.text = "HighScore: \(currentScore)"
                colorButtonBlue.isEnabled = false
                colorButtonRed.isEnabled = false
                colorButtonGreen.isEnabled = false
            }
        case 2:
            if emptyColorArr[2] == emptyColorArr.max() ?? 0.1 {
                displayLabel.text = "Correct! Keep Going!"
                currentScore += 1
                score.text = "Score: \(currentScore)"
                emptyColorArr = []
                generateRandomColor()
            } else {
                displayLabel.text = "Wrong. Do you want to play again?"
                finalScore = currentScore
                highScore.text = "HighScore: \(currentScore)"
                colorButtonBlue.isEnabled = false
                colorButtonRed.isEnabled = false
                colorButtonGreen.isEnabled = false
            }
        default:
            displayLabel.text = "bad boi"
        }
    }
}
