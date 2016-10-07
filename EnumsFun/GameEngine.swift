//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
    
    let player1: Player
    let player2: Player
    let deck: Deck
    
    init(player1: String, player2: String){
        self.deck = Deck()
        self.player1 = Player(name: player1, hand: Hand(cards: deck.split.0))
        self.player2 = Player(name: player2, hand: Hand(cards: deck.split.1))
    }
    
    func playOneTurn() -> (Player,Card?,Card?) {
        
        if player1.hasCards() == false {
            return (player2,nil,nil)
        }else if player2.hasCards() == false {
            return (player1,nil,nil)
        }else{
            print(player1.hand.size)
            print(player2.hand.size)
            let cardOfPlayer1 = player1.flip()
            let cardofPlayer2 = player2.flip()
            print(player1.hand.size)
            print(player2.hand.size)
            
            if (cardOfPlayer1?.rank.rawValue)! >= (cardofPlayer2?.rank.rawValue)! {
                return (player1,cardOfPlayer1,cardofPlayer2)
            }else{
                return (player2,cardOfPlayer1,cardofPlayer2)
            }
            
        }
    }
    
    func award(cards: [Card], to player: Player) {
        
            player.hand.cards += cards
        }
    
    func gameOver() -> Bool {
        return !self.player1.hasCards() || !self.player2.hasCards()
    }
    
}
