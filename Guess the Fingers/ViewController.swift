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
    

    @IBOutlet var numberOfGuessesLabel: UILabel!
    @IBOutlet var guessesLabel: UILabel!
    @IBOutlet var userGuess: UITextField!
    @IBOutlet var outputLabel: UILabel!
    
    
    @IBAction func guessButton(sender: AnyObject)
    {
        println("\(randomNumber)")
        guessesLabel.hidden = false
        var guess = userGuess.text.toInt()
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
            outputLabel.text = "You guessed the correct number"
            var resetAlert = UIAlertView()
            resetAlert.title = "You Guessed It"
            resetAlert.message = "You may now reset the game\nNumber of Guesses: \(guessesNumber + 1)"
            resetAlert.addButtonWithTitle("Reset Game")
            resetAlert.show()
            userGuess.text = nil
            randomNumber = Int(arc4random() % 100)
            outputLabel.text = "Now switch places"
            guessesNumber = 0
            numberOfGuessesLabel.text = "0"
            userGuess.resignFirstResponder()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var startAlert = UIAlertView()
        startAlert.title = "Guess the Fingers!"
        startAlert.message = "You have to guess how many fingers I have from 1-100. (I have a lot of fingers)\nSee how many guesses you can get!"
        startAlert.addButtonWithTitle("Ok, got it")
        startAlert.show()
        guessesLabel.hidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

