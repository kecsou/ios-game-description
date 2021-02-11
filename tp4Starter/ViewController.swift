//
//  ViewController.swift
//  tp4Starter
//
//  Created by Benoit Verdier on 11/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var games = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getGames()
    }
    
    func download(at url: String, handler: @escaping (Data?) -> Void) {
        // 1 - Create URL
        guard let url = URL(string: url) else {
            debugPrint("Failed to create URL")
            handler(nil)
            return
        }
        // 2 - Create GET Request
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        // 3 - Create download task, handler will be called when request ended
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            handler(data)
        }
        task.resume()
    }
    
    
    func getGames() {
        // 1 - Download games
        download(at: "https://education.3ie.fr/ios/StarterKit/GameCritic/GameCritics.json") { (gameData) in
            if let gameData = gameData {
                // 2 - Decode JSON into a array of Game object
                let decoder: JSONDecoder = JSONDecoder()
                do {
                    self.games = try decoder.decode([Game].self, from: gameData)
                    DispatchQueue.main.async {
                        //TODO : uncomment the following line to reload your tableview
                        //self.tableView.reloadData()
                    }
                    for game in self.games {
                        print(game.name)
                    }
                }
                catch {
                    debugPrint("Failed to parse data")
                }
            }
            else {
                debugPrint("Failed to get games data")
            }
        }
    }
    
    
}

