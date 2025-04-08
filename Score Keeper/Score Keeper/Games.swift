//
//  Games.swift
//  Score Keeper
//
//  Created by Jestin Dorius on 3/31/25.
//

import Foundation
import UIKit

struct Game: Equatable {
    
    static func == (lhs: Game, rhs: Game) -> Bool {
        lhs.title == rhs.title && lhs.players == rhs.players
    }
    
    var title: String
    var gameImage: UIImage
    var currentWinner: Player
    var players: [Player]
    var highestSort: Bool
    var highestWins = false
}

//MARK: Sorting Functions
func sortPlayersHighToLow() {
    players.sort {
        guard let score1 = Int($0.currentScore),
              let score2 = Int($1.currentScore) else {
            return false
        }
        return score1 > score2
    }
}

func sortPlayersLowToHigh() {
    players.sort {
        guard let score1 = Int($0.currentScore),
              let score2 = Int($1.currentScore) else {
            return false
        }
        return score1 < score2
    }
}

var games = [Game(title: "Black Jack",
                  gameImage: UIImage(systemName: "die.face.6")!,
                  currentWinner: player2,
                  players: [player1, player2, player4],
                  highestSort: true),
             Game(title: "Go Fish",
                  gameImage: UIImage(systemName: "die.face.6")!,
                  currentWinner: player1,
                  players: [player1, player2, player4, jesse],
                  highestSort: true),
             Game(title: "H.O.R.S.E.",
                  gameImage: UIImage(systemName: "die.face.6")!,
                  currentWinner: player1,
                  players: [player1, player2, player4, player3],
                  highestSort: false)]

