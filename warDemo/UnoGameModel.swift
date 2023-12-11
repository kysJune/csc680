//
//  UnoGameModel.swift
//  warDemo
//
//  Created by Radhakrishnan Poonthuruthi on 12/11/23.
//

import Foundation

class UnoGameModel: ObservableObject{
    @Published private var model = Uno()
    
    var Players: [Player]{
        return model.players
    }
    
    var topCards: [Card]{
        return model.topCards
    }
    
    func select(_ card: Card, in player: Player){
        model.select(card, in: player)
    }
    
    func play(_ card: Card, in player: inout Player) -> Bool{
        return model.play(card, in: player)
    }
}


