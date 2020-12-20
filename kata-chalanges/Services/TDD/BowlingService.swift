//
//  BowlingService.swift
//  kata-chalanges
//
//  Created by Лев Бондаренко on 10.12.2020.
//

import Foundation

class BowlingService {
    var score: Int = 0
    
    func roll(pins: Int) {
        self.score + pins
    }
    
    func getScore() -> Int {
        score
    }
}
