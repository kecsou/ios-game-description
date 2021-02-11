//
//  Game.swift
//  tp4Starter
//
//  Created by Benoit Verdier on 11/02/2021.
//

import Foundation

class Game: Decodable {
    var name: String
    var id: Int
    var smallImageURL: String
    var bigImageURL: String
    var score: Int
    var platform: String
    
    static func fakeGame() -> Game {
        return Game("Naruto", "fake small image", "fake big image", 4, "xbox")
    }

    init(name: String, id:Int, smallImageURL: String, bigImageURL: String, score: Int, platform: String) {
        self.name = name
        self.id = id
        self.smallImageURL = smallImageURL
        self.bigImageURL = bigImageURL
        self.score = score
        self.platform = platform
    }
}
