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
    var id: UUID
    
    static func == (lhs: Player, rhs: Player) -> Bool {
            return lhs.id == rhs.id
        }
    
    //initializer for new Players
    init(name: String, currentScore: String) {
        
        self.name = name
        self.currentScore = currentScore
        self.id = UUID()
        self.userImage = UIImage(systemName: "person.circle.fill")!
    }
    
    //init for existing players
    init(id: UUID, userImage: UIImage, name: String, currentScore: String) {
        self.id = id
        self.userImage = userImage
        self.name = name
        self.currentScore = currentScore
    }
}

let player1 = Player(name: "Player 1",
                     currentScore: "5")
let player2 = Player(name: "Player 2",
                     currentScore: "6")
let player3 = Player(name: "Player 3",
                     currentScore: "5")
let player4 = Player(name: "Player 4",
                     currentScore: "5")
let jesse = Player(name: "Jesse",
                   currentScore: "22")
var players = [player1, player2, player3, player4]
