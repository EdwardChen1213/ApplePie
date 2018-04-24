//
//  Game.swift
//  ApplePie
//
//  Created by Edwardchen on 24/4/18.
//  Copyright © 2018 Edwardchen. All rights reserved.
//

import Foundation
struct Game{
    var word : String //The word need to be guessed
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character] //The word arrays the gamer is inputting
    mutating func PlayerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }
    var formattedWord: String{
        var guessedWord = ""
        for letter in word{ //letter is the char user is inputting, word is the word need to be guessed//
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
         
            }
            else{
                guessedWord += "_"
       print(guessedWord)
            }
        }
        return guessedWord
    }
}
