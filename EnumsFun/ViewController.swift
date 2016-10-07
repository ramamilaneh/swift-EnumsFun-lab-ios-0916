//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!
    var scoreOfOpponentPlayer = 0
    var secoreOfPlayer = 0
    var newGame = GameEngine(player1: "Johann", player2: "Susan")
    
    @IBAction func flipCard(_ sender: UIButton) {
        
        
        if newGame.gameOver() == false{
            
        let firstRoundResult = newGame.playOneTurn()
            
        self.playerCardLabel.text = firstRoundResult.1?.description
        self.opponentCardLabel.text = firstRoundResult.2?.description
        self.winnerLabel.text = firstRoundResult.0.name
            
        if firstRoundResult.0.name == newGame.player1.name {
            
            self.secoreOfPlayer += 1
            self.playerScoreLabel.text = String(self.secoreOfPlayer)
            
        }else{
            
            self.scoreOfOpponentPlayer += 1
            self.opponentScoreLabel.text = String(self.scoreOfOpponentPlayer)
        }
        newGame.award(cards: [firstRoundResult.1!,firstRoundResult.2!], to: firstRoundResult.0)
        }
        else{
            
        startOver()
            
        }
}
    
    func startOver() {
        self.secoreOfPlayer = 0
        self.scoreOfOpponentPlayer = 0
        self.opponentCardLabel.text = ""
        self.opponentScoreLabel.text = ""
        self.playerCardLabel.text = ""
        self.playerScoreLabel.text = ""
        self.winnerLabel.text = ""
        self.newGame = GameEngine(player1: "Johann", player2: "Susan")
    }
    
}
