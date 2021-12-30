//
//  SavesCaretaker.swift
//  Millionaire
//
//  Created by Никита Троян on 30.12.2021.
//


import Foundation

final class SavesCaretaker {
    
    let encode = JSONEncoder()
    let decode = JSONDecoder()
    let key = "records"
    
    func save(_ records: [GameSession]) {
        do {
            let data = try encode.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func load() -> [GameSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {return []}
        do {
            return try decode.decode([GameSession].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
