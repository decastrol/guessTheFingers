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
    @IBOutlet var switchToUserButton: UIButton!
    @IBAction func switchToUser(sender: AnyObject) {
    }
    
    var userGuesses: Int = 0
    var compPoints:Int = 0
    var mePoints: Int = 0
    
    @IBAction func putInAnswer(sender: AnyObject) {
        userGivesAnswer.resignFirstResponder()
        self.numberPutter.hidden = true
        var answer = self.userGivesAnswer.text.toInt()
        var computerNumberGuess = 50
        var guessIncrement = 50
        var guessCounter = 0
        if (answer > 0 && answer < 101){
        while computerNumberGuess != answer{
            if (computerNumberGuess > answer) {
                self.computerGuess.text = String(computerNumberGuess)
                self.computerOutput.text = "Huh, too high!"
                ++guessCounter
                self.numberOfComputerGuesses.text = String(guessCounter)
                
                var floatGuessIncrement:Double = Double(guessIncrement)
                floatGuessIncrement = ceil(floatGuessIncrement/2)
                guessIncrement = Int(floatGuessIncrement)
//                println("\(guessIncrement)")
                computerNumberGuess = computerNumberGuess - guessIncrement
                println("\(computerNumberGuess)")
            }
            else if (computerNumberGuess < answer) {
                self.computerOutput.text = "Oh, too low"
                self.computerGuess.text = String(computerNumberGuess)
                ++guessCounter;
                self.numberOfComputerGuesses.text = String(guessCounter)
                var floatGuessIncrement:Double = Double(guessIncrement)
                floatGuessIncrement = ceil(floatGuessIncrement/2)
                guessIncrement = Int(floatGuessIncrement)
                println("\(computerNumberGuess)")
                computerNumberGuess = computerNumberGuess + guessIncrement
            }
        }
        
        
        if (computerNumberGuess == answer) {
            self.computerOutput.text = "Got It!"
            userGivesAnswer.resignFirstResponder()
            self.computerGuess.text = String(computerNumberGuess)
            ++guessCounter
            self.numberOfComputerGuesses.text = String(guessCounter)
            
            if (self.userGuesses > guessCounter){
                ++compPoints
                self.computerScore.text = String(compPoints)
                NSUserDefaults.standardUserDefaults().setObject(compPoints, forKey: "computer points")
            }
            else if(self.userGuesses < guessCounter){
                ++mePoints
                NSUserDefaults.standardUserDefaults().setObject(mePoints, forKey: "user points")
                self.userScore.text = String(mePoints)
            }
            
            var switchAlert = UIAlertView()
            switchAlert.title = "The Phone Guessed It!"
            switchAlert.message = "Now its your turn to guess the number"
            switchAlert.addButtonWithTitle("Okay")
            switchAlert.show()
            
            userGivesAnswer.resignFirstResponder()
            switchToUserButton.hidden = false
            guessCounter = 0
            guessIncrement = 50
        }
        }
        else {
            userGivesAnswer.resignFirstResponder()
            computerOutput.text = "Not Valid Number"
            numberPutter.hidden = false
            userGivesAnswer.text = nil
        }
        
    }
    
        
    override func viewDidLoad() {
        
        var startComputerAlert = UIAlertView()
        startComputerAlert.title = "Computer Turn"
        startComputerAlert.message = "Put a number in for your phone to guess!"
        startComputerAlert.addButtonWithTitle("Okay")
        startComputerAlert.show()
        
        self.userScore.text = String(mePoints)
        self.computerScore.text = String(compPoints)
        
        self.computerGuess.text = ""
        self.numberPutter.hidden = false
        switchToUserButton.hidden = true
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showUser") {
            var normalVc = segue.destinationViewController as ViewController
            normalVc.humanPoints = mePoints
            normalVc.computerPoints = compPoints
        }
    }
    
}