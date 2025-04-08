//
//  Player.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 3/25/25.
//
import UIKit

struct Player: Equatable {
    var userImage: UIImage
    var name: String
    var currentScore: String
    
}

let player1 = Player(userImage: UIImage(systemName: "person.circle.fill")!,
                     name: "Player 1",
                     currentScore: "5")
let player2 = Player(userImage: UIImage(systemName: "person.circle.fill")!,
                     name: "Player 2",
                     currentScore: "6")
let player3 = Player(userImage: UIImage(systemName: "person.circle.fill")!,
                     name: "Player 3",
                     currentScore: "5")
let player4 = Player(userImage: UIImage(systemName: "person.circle.fill")!,
                     name: "Player 4",
                     currentScore: "5")
let jesse = Player(userImage: UIImage(systemName: "person.circle.fill")!,
                     name: "Jesse",
                     currentScore: "22")
var players = [player1, player2, player3, player4]
