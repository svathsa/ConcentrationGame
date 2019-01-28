//
//  Card.swift
//  test3
//
//  Created by CLICC User on 1/23/19.
//  Copyright © 2019 CLICC User. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int //card cannot have emojis variable because models are ui independent. Emoji comes under how we display the card.
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier()->Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier() //this is how we call a static method.
    }
    
    init(copyFrom: Card){
        self.identifier = copyFrom.identifier
    }
}

