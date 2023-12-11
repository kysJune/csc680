//
//  UnoGame.swift
//  warDemo
//
//

import Foundation

enum Suit: CaseIterable{
    case blue, green, red, yellow, wild
}

struct Card: Identifiable {
    var id = UUID()
    
    var suit: Suit
    var rank: Int
    var selected = false
    var filename: String{
        if(rank == 10){
            return "\(suit)_picker"
        }
        if(rank == 11){
            return "\(suit)_reverse"
        }
        if(rank == 12){
            return "\(suit)_skip"
        }
        return "\(suit)_\(rank)"
    }
}

typealias Stack = [Card]

struct Player: Identifiable {
    var id = UUID()
    
    var Hand = Stack()
    var isMe = false
}

struct Deck {
    private var deck = Stack()
    
    //initializes deck with all cards
    mutating func createDeck() {
        for suit in Suit.allCases {
            for rank in 0...12{
                if(suit != .wild){
                    deck.append(Card(suit: suit, rank: rank))
                }
            }
        }
        for _ in 0...7{
            deck.append(Card(suit: .wild, rank: 13))
        }
    }
    
    mutating func shuffle(){
        deck.shuffle()
    }
    
    mutating func drawCard() -> Card?{
        if(deck.isEmpty){
            return nil
        }
        else{
            return deck.removeLast()
        }
    }
}

struct Uno {
    private(set) var players: [Player]
    var topCards = Stack()
    
    init() {
        //initializing Deck---------------
        var deck = Deck()
        deck.createDeck()
        deck.shuffle()
        
        //initializing players-------------
        let opponents = [
            Player(),
            Player()
        ]
        players = opponents
        players.append(Player(isMe: true))
        
        //dealing hand---------------------
        for player in 0...2{
            //starting handsize is 5
            for _ in 0...9{
                //draws a card from deck and places it in hand of player
                //NOTE: force unwrapping the newCard because we are guaranteed to have the necessary cards here, will not return nil
                let newCard = deck.drawCard()!
                players[player].Hand.append(newCard)
            }
        }
        
        //flipping top card to start game
        topCards.append(deck.drawCard()!)
        topCards.append(deck.drawCard()!)
        topCards.append(deck.drawCard()!)
    }
    
    mutating func select(_ card: Card, in player: Player){
        if let cardIndex = player.Hand.firstIndex(where: {$0.id == card.id}){
            if let playerIndex = players.firstIndex(where: {$0.id == player.id}){
                players[playerIndex].Hand[cardIndex].selected.toggle()
            }
        }
    }
    
//    mutating func play(_ card: Card, in player: Player) -> Bool{
//        if (card.suit == top3[0].suit || card.rank == top3[0].rank){
//            top3[2] = top3[1]
//            top3[1] = top3[0]
//            top3[0] = card
//            return true
//        }
//        return false
//    }
}


//testing
var testPlayers = [
    Player(),
    Player(),
    Player(),
    Player(isMe: true),
]
var testCards = [
    Card(suit: .blue, rank: 3),
    Card(suit: .red, rank: 3),
    Card(suit: .yellow, rank: 3),
    Card(suit: .blue, rank: 3),
    Card(suit: .blue, rank: 3),
    Card(suit: .blue, rank: 3),
    Card(suit: .red, rank: 3),
    Card(suit: .yellow, rank: 12),
    
]
