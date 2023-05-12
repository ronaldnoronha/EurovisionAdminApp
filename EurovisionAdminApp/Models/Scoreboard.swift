//
//  Scoreboard.swift
//  EurovisionAdminApp
//
//  Created by Ronald Noronha on 12/5/2023.
//

import Foundation

class Scoreboard {
    var scores: [String: Int] = [:]
        
    func addVotes(vote: Vote) {
        addPoints(country: vote.points12, points: 12)
        addPoints(country: vote.points10, points: 10)
        addPoints(country: vote.points8, points: 8)
        addPoints(country: vote.points7, points: 7)
        addPoints(country: vote.points6, points: 6)
        addPoints(country: vote.points5, points: 5)
        addPoints(country: vote.points4, points: 4)
        addPoints(country: vote.points3, points: 3)
        addPoints(country: vote.points2, points: 2)
        addPoints(country: vote.points1, points: 1)
    }
    
    func addPoints(country: String, points: Int) {
        if scores.keys.contains(country) {
            scores[country]! += points
        } else {
            scores[country] = points
        }
    }
    
    func printScoreboard() {
        let sortedScores = scores.sorted { $0.1 > $1.1 }
        
        for score in sortedScores {
            print(score)
        }
    }
}
