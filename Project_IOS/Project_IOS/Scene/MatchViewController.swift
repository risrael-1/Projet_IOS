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
    @IBOutlet weak var dateLabel: UILabel!
    
    static func newInstance(foot: Foot) -> MatchViewController {
        let controller = MatchViewController()
        controller.foot = foot
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "\(foot.team1.name) VS \(foot.team2.name)"
        
        if let id = self.foot.id {
            self.footService.getMatchInfo(id: id) { (foot) in
                DispatchQueue.main.sync {
                    self.foot = foot
                    self.reloadUI()
                    self.fetchAndReloadImageView()
                }
            }
        }
    }
    
    private func reloadUI(){
        guard let foot = self.foot else {
            return
        }
        self.team1.text = "\(foot.team1.name)"
        self.team2.text = "\(foot.team2.name)"
        self.scoreTeam1.text = "\(foot.team1.score)"
        self.scoreTeam2.text = "\(foot.team2.score)"
        self.dateLabel.text = "\(foot.date)"
    }
    
    private func fetchAndReloadImageView(){
        
        if let team1 = self.foot.team1.logo,
           let team2 = self.foot.team2.logo {
            self.imageService.getImage(from: team1) { (img) in
                DispatchQueue.main.sync {
                    self.logoTeam1.image = img
                }
            }
            self.imageService.getImage(from: team2) { (img) in
                DispatchQueue.main.sync {
                    self.logoTeam2.image = img
                }
            }
        }
    }



}
