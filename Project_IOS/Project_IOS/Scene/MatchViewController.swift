//
//  MatchViewController.swift
//  Project_IOS
//
//  Created by Raphael on 21/02/2021.
//

import UIKit

class MatchViewController: UIViewController {
    var foot: Foot!
    var footService: FootService = FootService()
    var imageService: ImageService = ImageService()
    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
    @IBOutlet weak var scoreTeam1: UILabel!
    @IBOutlet weak var scoreTeam2: UILabel!
    @IBOutlet weak var logoTeam1: UIImageView!
    @IBOutlet weak var logoTeam2: UIImageView!
    
    static func newInstance(foot: Foot) -> MatchViewController {
        let controller = MatchViewController()
        controller.foot = foot
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "\(foot.team1.name) VS \(foot.team2.name)"
        self.team1.text = "\(foot.team1.name)"
        self.team2.text = "\(foot.team2.name)"
        self.scoreTeam1.text = "\(foot.team1.score)"
        self.scoreTeam2.text = "\(foot.team2.score)"
    }



}
