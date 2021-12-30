//
//  Game.swift
//  Millionaire
//
//  Created by Никита Троян on 30.12.2021.
//

import Foundation

final class Game {
    
    static let shared = Game()
    private let caretaker = SavesCaretaker()
    var game = GameSession(date: Date())
    
    private(set) var games:[GameSession] {
        didSet {
            self.caretaker.save(self.games)
        }
    }
    
    private init() {
        self.games = self.caretaker.load()
    }
    
    func addGame(_ game: GameSession) {
        self.games.append(game)
    }
}
