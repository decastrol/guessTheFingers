//
//  computerViewController.swift
//  Guess the Fingers
//
//  Created by Luke de Castro on 12/11/14.
//  Copyright (c) 2014 Luke de Castro. All rights reserved.
//

import Foundation
import UIKit

class computerViewController: UIViewController {

    
    @IBOutlet var computerScore: UILabel!
    @IBOutlet var userScore: UILabel!
    @IBOutlet var userGivesAnswer: UITextField!
    @IBOutlet var computerGuess: UILabel!
    @IBOutlet var computerOutput: UILabel!
    @IBOutlet var numberOfComputerGuesses: UILabel!
    @IBOutlet var numberPutter: UIButton!
    
    @IBAction func putInAnswer(sender: AnyObject) {
        self.resignFirstResponder()
        self.numberPutter.hidden = true
        var answer = self.userGivesAnswer.text.toInt()
        var computerNumberGuess = 50
        var guessIncrement = 50
        var guessCounter = 0
        
        while computerNumberGuess != answer{
            
            if (computerNumberGuess > answer) {
                self.computerGuess.text = String(computerNumberGuess)
                self.computerOutput.text = "Huh, too high!"
                ++guessCounter
                self.numberOfComputerGuesses.text = String(guessCounter)
                guessIncrement = guessIncrement/2
                computerNumberGuess = computerNumberGuess - guessIncrement
            }
            else if (computerNumberGuess < answer) {
                self.computerOutput.text = "Oh, too low"
                self.computerGuess.text = String(computerNumberGuess)
                ++guessCounter;
                self.numberOfComputerGuesses.text = String(guessCounter)
                guessIncrement = guessIncrement/2
                computerNumberGuess = computerNumberGuess + guessIncrement
            }
            //var delayTimer: NSTimer =
        }
        
        if (computerNumberGuess == answer) {
            self.computerOutput.text = "Got It!"
            self.computerGuess.text = String(computerNumberGuess)
            ++guessCounter
            self.numberOfComputerGuesses.text = String(guessCounter)
            
            var switchAlert = UIAlertView()
            switchAlert.title = "The Phone Guessed It!"
            switchAlert.message = "Now its your turn to guess the number"
            switchAlert.addButtonWithTitle("Okay")
            switchAlert.show()
            
            guessCounter = 0
            guessIncrement = 50
        }
    }
    
    override func viewDidLoad() {
        
        self.computerGuess.text = ""
        self.numberPutter.hidden = false
        
    }
}