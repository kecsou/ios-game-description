//
//  GameTVC.swift
//  tp4Starter
//
//  Created by Kévin VOYER on 11/02/2021.
//

import UIKit

class GameTVC: UITableViewController {

    var games = [Game]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getGames()
    }

    // MARK: Download games functions
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
                        self.tableView.reloadData()
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.games.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)

        let game = self.games[indexPath.row]
        if let textLabel = cell.textLabel {
            textLabel.text = game.name
        }

        if let imageView = cell.imageView {
            let url = URL(string: game.smallImageURL)
            if let url = url {
                let data = try? Data.init(contentsOf: url)
                if let data = data {
                    imageView.image = UIImage(data: data)
                }
            }
        }
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "pushDetail" {
            let gameDetailVC: GameDetailVC = segue.destination as! GameDetailVC
            let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
            if let indexPath = indexPath {
                let game = self.games[indexPath.row]
                    gameDetailVC.gameToDisplay(game: game)
            }
        }
    }
}
