//
//  Concentration.swift
//  test3
//
//  Created by CLICC User on 1/23/19.
//  Copyright © 2019 CLICC User. All rights reserved.
//

import Foundation

class Concentration
{
    var cards =  [Card]() // this is how we initialize struct types in a class. We can pass arguments to the parenthesis. We can also initialize as [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceUpCard = nil
            }else {
                    for flipDownIndex in cards.indices {
                        cards[flipDownIndex].isFaceUp = false
                    }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceUpCard = index
                    
                }
            }
        }

    
    init(numberOfPairsOfCards: Int){
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)//this is valid because putting things in an array also is pass by value as Array is a struct. So a copy of card is passed in both cases. You can also append by saying cards = [card, card]
        }
        
        for index in 0..<numberOfPairsOfCards{
            let n = Int(arc4random_uniform(UInt32(numberOfPairsOfCards*2)))
            var temp = Card()
            temp.identifier = cards[index].identifier
            temp.isFaceUp = cards[index].isFaceUp
            temp.isMatched = cards[index].isMatched
            cards[index].identifier = cards[n].identifier
            cards[index].isFaceUp = cards[n].isFaceUp
            cards[index].isMatched = cards[n].isMatched
            cards[n].identifier = temp.identifier
            cards[n].isFaceUp = temp.isFaceUp
            cards[n].isMatched = temp.isMatched
            
        }
    }
    
    
}
