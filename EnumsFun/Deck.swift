//
//  Deck.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Deck {
    
    var cards = [Card]()
    var split : ([Card],[Card])
    init() {
        for suit in Suit.allCases{
            for index in 2...14{
                let rank = Rank(rawValue: index)
                self.cards.append(Card(rank: rank!, suit: suit))
              
            }
        }
       
        cards.shuffle()
        self.split = self.cards.split()
       
    }
    
    
}
