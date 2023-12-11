//
//  UnoGame.swift
//  warDemo
//
//

import Foundation

enum Suit{
    case blue, green, red, yellow
}

struct Card: Identifiable {
    var id = UUID()
    
    var color: Suit
    var rank: Int
    var filename: String{
        return "\(color)_\(rank)"
    }
}

typealias Hand = [Card]

struct Player {
    var Cards = testCards //Hand()
    var isMe = false
}

struct Uno {
    
}

var testPlayers = [
    Player(),
    Player(),
    Player(),
    Player(isMe: true),
]
var testCards = [
    Card(color: .blue, rank: 3),
    Card(color: .red, rank: 3),
    Card(color: .yellow, rank: 3),
    Card(color: .blue, rank: 3),
    Card(color: .blue, rank: 3),
    Card(color: .blue, rank: 3),
    Card(color: .red, rank: 3),
    Card(color: .yellow, rank: 3),
    
]
