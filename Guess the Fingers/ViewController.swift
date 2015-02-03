//
//  ViewController.swift
//  Guess the Fingers
//
//  Created by Luke de Castro on 12/1/14.
//  Copyright (c) 2014 Luke de Castro. All rights reserved.
//

import UIKit

var randomNumber = Int(arc4random() % 100)
var guessesNumber = 0
class ViewController: UIViewController {
    

    @IBOutlet var guessButtonObject: UIButton!
    @IBOutlet var compScore: UILabel!
    @IBOutlet var youScore: UILabel!
    @IBOutlet var numberOfGuessesLabel: UILabel!
    @IBOutlet var guessesLabel: UILabel!
    @IBOutlet var userGuess: UITextField!
    @IBOutlet var outputLabel: UILabel!
    @IBOutlet var switchToComputerButton: UIButton!
    @IBAction func switchToComputer(sender: AnyObject) {
    }
    
    var computerPoints = 0
    var humanPoints = 0
    
    @IBAction func guessButton(sender: AnyObject)
    {
        println("\(randomNumber)")
        guessesLabel.hidden = false
        var guess = userGuess.text.toInt()
        if (guess < 101  && guess > -1){
        if (guess > randomNumber){
            outputLabel.text = "Too High"
            userGuess.text = nil
            guessesNumber =  guessesNumber + 1
            numberOfGuessesLabel.text = "\(guessesNumber)"
            }
        else if (guess < randomNumber){
            outputLabel.text = "Too Low"
            userGuess.text = nil
            guessesNumber =  guessesNumber + 1
            numberOfGuessesLabel.text = "\(guessesNumber)"
        }
        else if (guess == randomNumber) {
            ++guessesNumber
            outputLabel.text = "You guessed the correct number"
            numberOfGuessesLabel.text = String(guessesNumber)
            
            var resetAlert = UIAlertView()
            resetAlert.title = "You Guessed It"
            resetAlert.message = "You may now switch places\nNumber of Guesses: \(guessesNumber)"
            resetAlert.addButtonWithTitle("Got it")
            resetAlert.show()
            userGuess.text = nil
            
            outputLabel.text = "Now switch places"
            userGuess.resignFirstResponder()
            self.switchToComputerButton.hidden = false
            guessButtonObject.hidden = true
        }
    }
        else {
            userGuess.resignFirstResponder()
            outputLabel.text = "Not A Valid Guess"
            userGuess.text = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessesNumber = 0
        
        self.compScore.text = String(computerPoints)
        self.youScore.text = String(humanPoints)
        NSUserDefaults.standardUserDefaults().setObject(computerPoints, forKey: "computer points")
        NSUserDefaults.standardUserDefaults().setObject(humanPoints, forKey: "user points")
        
        computerPoints = NSUserDefaults.standardUserDefaults().objectForKey("computer points") as Int
        humanPoints = NSUserDefaults.standardUserDefaults().objectForKey("user points") as Int
        
        var startAlert = UIAlertView()
        startAlert.title = "Guess the Fingers!"
        startAlert.message = "You have to guess how many fingers I have from 0-100. (I have a lot of fingers)\nSee how many guesses you can get!"
        startAlert.addButtonWithTitle("Ok, got it")
        startAlert.show()
        guessesLabel.hidden = true
        self.switchToComputerButton.hidden = true
        
        randomNumber = Int(arc4random() % 100)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showComputer") {
            var compVc = segue.destinationViewController as computerViewController
            compVc.userGuesses = guessesNumber
            compVc.mePoints = humanPoints
            compVc.compPoints = computerPoints
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

