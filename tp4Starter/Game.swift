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
        return Game(name: "Naruto", id: 0,smallImageURL: "fake small image", bigImageURL: "fake big image", score: 4, platform: "xbox")
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
