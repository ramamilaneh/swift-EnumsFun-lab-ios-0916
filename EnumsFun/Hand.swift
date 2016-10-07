//
//  Hand.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Hand {
    var cards: [Card]
    var size: Int {
        return self.cards.count
    }
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    func flip() -> Card? {
        if self.cards.isEmpty {
            return nil
        }else{
            let flipedCard = cards.remove(at: self.size-1)
          return flipedCard
        }
    }
    
    func give(card: Card) {
        cards.insert(card, at: 0)
    }
    
    func lose(card: Card) {
        for (index,findcard) in self.cards.enumerated(){
            if findcard.description == card.description{
                cards.remove(at: index)
            
            }
        }
    }
    
}
