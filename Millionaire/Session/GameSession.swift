//
//  GameSession.swift
//  Millionaire
//
//  Created by Никита Троян on 30.12.2021.
//

import Foundation

protocol GameSessionDelegate: AnyObject {
    func addScore()
}

final class GameSession: Codable {
    var curentScore = 0
    var date: Date
    func finalScore() -> String {
        return "Final score \(curentScore) from 2"
    }
    init(date: Date) {
        self.date = date
    }
    
}
