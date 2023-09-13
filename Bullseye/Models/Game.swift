//
//  Game.swift
//  Bullseye
//
//  Created by Roman on 9/5/23.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    mutating func calaculateScore(from slider: Int) -> Int{
        print("Calling calculateScore slider \(slider)")
        let result = 100 - abs(target - slider)
        print("Result \(result)")
        score += result
        print("Score \(score)")
        return result
    }
    //mutating changes the values inside the structure
    mutating func startNewRound(points: Int){
        round += 1
        target = Int.random(in: 1...100)
        
    }
    mutating func restart(){
        score = 0
        round = 1
        
    }
}
