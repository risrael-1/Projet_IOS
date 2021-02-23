//
//  BasketViewController.swift
//  Project_IOS
//
//  Created by Raphael on 07/02/2021.
//

import UIKit

class BasketViewController: UIViewController {
    
    @IBOutlet weak var basketTableView: UITableView!
    var leagueService: LeagueService = LeagueService()
    var imageService: ImageService = ImageService()
    var leagues: [League] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "BASKET"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(handleFavorite))
        
        self.basketTableView.dataSource = self
        self.basketTableView.delegate = self
    }
    
    @objc func handleFavorite(){
        let controller = FavoriteBasketViewController()
        self.navigationController?.pushViewController(controller, animated: true)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        leagueService.list { (leagues) in
            self.leagues = leagues
            DispatchQueue.main.sync {
                self.basketTableView.reloadData()
            }
        }
    }


}

extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leagues.count
    }
    
    // indexPath.row -> n° de ligne
    // indexPath.section -> n° de la section (par def 1 section)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let league = self.leagues[indexPath.row] // recuperer le café à la bonne ligne
        let cell = self.getLeagueCell(tableView: tableView)
        cell.textLabel?.text = league.name
        if let pictureURL = league.logo {
            self.imageService.getImage(from: pictureURL) { (img) in
                DispatchQueue.main.sync {
                    cell.imageView?.image = img
                }
            }
        }
        
        return cell
    }
    
    func getLeagueCell(tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "league_identifier") else {
            return UITableViewCell(style: .default, reuseIdentifier: "league_identifier")
        }
        return cell
    }
}

extension BasketViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let league = self.leagues[indexPath.row]
        let controller = BasketMatchesViewController.newInstance(league: league)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let league = self.leagues[sourceIndexPath.row]
        self.leagues.remove(at: sourceIndexPath.row)
        self.leagues.insert(league, at: destinationIndexPath.row)
        
    }
}
