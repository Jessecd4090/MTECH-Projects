//
//  Player.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 3/25/25.
//
import UIKit

struct Player {
    var userImage: UIImage
    var name: String
    var currentScore: String
    
}

var players = [
    Player(userImage: UIImage(systemName: "person.circle.fill")!,
           name: "Player 1",
           currentScore: "5"),
    Player(userImage: UIImage(systemName: "person.circle.fill")!, name: "Player 2", currentScore: "6")
]
