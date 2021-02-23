//
//  BasketMatchesViewController.swift
//  Project_IOS
//
//  Created by Eduard Serban on 21/02/2021.
//

import UIKit

class BasketMatchesViewController: UIViewController {
    
    @IBOutlet weak var matchTableView: UITableView!
    var matchService: BasketMatchService = BasketMatchService()
    var matchs: [BasketballMatch] = []
    var league: League!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(self.league.name) - \(self.league.seasons ?? "")"
        
        self.matchTableView.dataSource = self
        self.matchTableView.delegate = self
    }
    
    
    
    static func newInstance(league: League) -> BasketMatchesViewController {
        let controller = BasketMatchesViewController()
        controller.league = league
        return controller
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        matchService.listByLeague(league: league) { (matchs) in
            self.matchs = matchs
            DispatchQueue.main.sync {
                self.matchTableView.reloadData()
            }
        }
    }

}

extension BasketMatchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matchs.count
    }
    
    // indexPath.row -> n° de ligne
    // indexPath.section -> n° de la section (par def 1 section)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let match = self.matchs[indexPath.row] // recuperer le café à la bonne ligne
        let cell = self.getMatchCell(tableView: tableView)
        cell.textLabel?.text = "\(match.teams.home.name): \(match.teams.home.score.total ?? 0) VS \(match.teams.away.score.total ?? 0) :\(match.teams.away.name)"
        
        
        return cell
    }
    
    func getMatchCell(tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "match_identifier") else {
            return UITableViewCell(style: .default, reuseIdentifier: "match_identifier")
        }
        return cell
    }
}

extension BasketMatchesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let match = self.matchs[indexPath.row] // recuperer le café à la bonne ligne
        let controller = BasketMatchDetailViewController.newInstance(match: match)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
