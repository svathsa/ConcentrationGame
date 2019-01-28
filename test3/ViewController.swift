//
//  ViewController.swift
//  test3
//
//  Created by CLICC User on 1/22/19.
//  Copyright © 2019 CLICC User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var game = Concentration(numberOfPairsOfCards: buttonCollection.count/2) //this is serves point of contact between Controller and the Model.
    

    @IBOutlet weak var flipCountLabel: UILabel!
    
    var nFlips = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(nFlips)"
        }
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    
    
    
    @IBAction func onClick(_ sender: UIButton) {
        nFlips += 1
        if let cardNumber = buttonCollection.index(of: sender) {
            game.chooseCard(at: cardNumber) //this is how we update our view from the model.
            updateViewFromModel()
        } else {
            print("Invalid")
        }
        
    }
    
    func updateViewFromModel() {
        for index in 0..<(buttonCollection.count){ //allows us to loop through an array
            let card = game.cards[index]
                        let button = buttonCollection[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 0) : #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            }
            
            
        }
    }
    
    var emojiArray = ["🎃","🌚","😾","👻","🦇","🍎","🍬","😈"]
    var emoji = Dictionary<Int,String>()
    
    
    func emoji(for card:Card) -> String {
        if emoji[card.identifier]==nil, emojiArray.count > 0 {
        
            let randomIndex = arc4random_uniform(UInt32(emojiArray.count))
            emoji[card.identifier] = emojiArray.remove(at: Int(randomIndex))

        }
        return emoji[card.identifier] ?? "?"
    }
}

