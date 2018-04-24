//
//  ViewController.swift
//  ApplePie
//
//  Created by Edwardchen on 24/4/18.
//  Copyright © 2018 Edwardchen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["swift", "dream", "capture", "pig"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet{
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet{
            newRound()
        }
    }
   @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.PlayerGuessed(letter: letter)
        updateGameState()
    }
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
        }
        else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
        }
        else {
            updateUI()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newRound()
    }
    
    var currentGame : Game!
    
    func newRound(){
        if !listOfWords.isEmpty{
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed,guessedLetters: [])
            enableLetterButtons(true)
        updateUI()
        }
        else{
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable : Bool){
        for button in letterButtons{
            button.isEnabled = enable
        }
    }
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
       // correctWordLabel.text = currentGame.formattedWord
        scoreLabel.text = "Wins: \(totalWins), Losses:\(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

