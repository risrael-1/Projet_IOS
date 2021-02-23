//
//  BasketMatchDetailViewController.swift
//  Project_IOS
//
//  Created by Eduard Serban on 23/02/2021.
//

import UIKit

class BasketMatchDetailViewController: UIViewController {
    
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var awayTeamImageView: UIImageView!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var q1HomeNameLabel: UILabel!
    @IBOutlet weak var q2HomeNameLabel: UILabel!
    @IBOutlet weak var q3HomeNameLabel: UILabel!
    @IBOutlet weak var q4HomeNameLabel: UILabel!
    @IBOutlet weak var overtimeHomeNameLabel: UILabel!
    @IBOutlet weak var q1AwayNameLabel: UILabel!
    @IBOutlet weak var q2AwayNameLabel: UILabel!
    @IBOutlet weak var q3AwayNameLabel: UILabel!
    @IBOutlet weak var q4AwayNameLabel: UILabel!
    @IBOutlet weak var overtimeAwayNameLabel: UILabel!
    @IBOutlet weak var q1HomeScoreLabel: UILabel!
    @IBOutlet weak var q2HomeScoreLabel: UILabel!
    @IBOutlet weak var q3HomeScoreLabel: UILabel!
    @IBOutlet weak var q4HomeScoreLabel: UILabel!
    @IBOutlet weak var overtimeHomeScoreLabel: UILabel!
    @IBOutlet weak var q1AwayScoreLabel: UILabel!
    @IBOutlet weak var q2AwayScoreLabel: UILabel!
    @IBOutlet weak var q3AwayScoreLabel: UILabel!
    @IBOutlet weak var q4AwayScoreLabel: UILabel!
    @IBOutlet weak var overtimeAwayScoreLabel: UILabel!
    var match: BasketballMatch!
    var matchService: BasketMatchService = BasketMatchService()
    var imageService: ImageService = ImageService()
    
    
    static func newInstance(match: BasketballMatch) -> BasketMatchDetailViewController {
        let controller = BasketMatchDetailViewController()
        controller.match = match
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(self.match.teams.home.name): \(self.match.teams.home.score.total ?? 0) VS \(self.match.teams.away.score.total ?? 0) :\(self.match.teams.away.name)"
        self.overtimeAwayNameLabel.text = NSLocalizedString("controller.basketMatchDetails.overtime", comment: "")
        self.overtimeHomeNameLabel.text = NSLocalizedString("controller.basketMatchDetails.overtime", comment: "")
        self.q1HomeNameLabel.text = NSLocalizedString("controller.basketMatchDetails.q1", comment: "")
        self.q1AwayNameLabel.text = NSLocalizedString("controller.basketMatchDetails.q1", comment: "")
        self.q2HomeNameLabel.text = NSLocalizedString("controller.basketMatchDetails.q2", comment: "")
        self.q2AwayNameLabel.text = NSLocalizedString("controller.basketMatchDetails.q2", comment: "")
        self.q3HomeNameLabel.text = NSLocalizedString("controller.basketMatchDetails.q3", comment: "")
        self.q3AwayNameLabel.text = NSLocalizedString("controller.basketMatchDetails.q3", comment: "")
        self.q4HomeNameLabel.text = NSLocalizedString("controller.basketMatchDetails.q4", comment: "")
        self.q4AwayNameLabel.text = NSLocalizedString("controller.basketMatchDetails.q4", comment: "")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleFavorite))
        if let id = self.match.id {
            self.matchService.getMatchInfo(id: id) { (match) in
                DispatchQueue.main.sync {
                    self.match = match
                    self.reloadUI()
                    self.fetchAndReloadImageView()
                }
            }
        }
        
        
    }
    @objc func handleFavorite(){
        let controller = FavoriteBasketViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func reloadUI(){
        guard let match = self.match else {
            return
        }
        self.homeTeamNameLabel.text = match.teams.home.name
        self.awayTeamNameLabel.text = match.teams.away.name
        self.homeTeamScoreLabel.text = "\(match.teams.home.score.total ?? 0)"
        self.awayTeamScoreLabel.text = "\(match.teams.away.score.total ?? 0)"
        self.q1HomeScoreLabel.text = "\(match.teams.home.score.quarter1 ?? 0)"
        self.q2HomeScoreLabel.text = "\(match.teams.home.score.quarter2 ?? 0)"
        self.q3HomeScoreLabel.text = "\(match.teams.home.score.quarter3 ?? 0)"
        self.q4HomeScoreLabel.text = "\(match.teams.home.score.quarter4 ?? 0)"
        self.q1AwayScoreLabel.text = "\(match.teams.away.score.quarter1 ?? 0)"
        self.q2AwayScoreLabel.text = "\(match.teams.away.score.quarter2 ?? 0)"
        self.q3AwayScoreLabel.text = "\(match.teams.away.score.quarter3 ?? 0)"
        self.q4AwayScoreLabel.text = "\(match.teams.away.score.quarter4 ?? 0)"
        self.overtimeHomeScoreLabel.text = "\(match.teams.home.score.overtime ?? 0)"
        self.overtimeAwayScoreLabel.text = "\(match.teams.away.score.overtime ?? 0)"
    }
    
    private func fetchAndReloadImageView(){
        
        if let homeLogo = self.match?.teams.home.logo,
           let awayLogo = self.match?.teams.away.logo{
            self.imageService.getImage(from: homeLogo) { (img) in
                DispatchQueue.main.sync {
                    self.homeTeamImageView.image = img
                }
            }
            self.imageService.getImage(from: awayLogo) { (img) in
                DispatchQueue.main.sync {
                    self.awayTeamImageView.image = img
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
