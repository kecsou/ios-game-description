//
//  GameDetailVC.swift
//  tp4Starter
//
//  Created by Kévin VOYER on 11/02/2021.
//

import UIKit

class GameDetailVC: UIViewController {

    @IBOutlet var gameTitle: UILabel!
    var game: Game!
    @IBOutlet var imageGame: UIImageView!
    @IBOutlet var platformGame: UILabel!
    @IBOutlet var scoreGame: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let game = self.game {
            self.gameTitle.text = game.name
            self.platformGame.text = game.platform
            self.scoreGame.text = String(game.score)
            let url = URL(string: game.bigImageURL)
            if let url = url {
                let data = try? Data.init(contentsOf: url)
                if let data = data {
                    self.imageGame.image = UIImage(data: data)
                }
            }
        }
        // Do any additional setup after loading the view.
    }

    func gameToDisplay(game: Game) {
        self.game = game
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }*/

}
