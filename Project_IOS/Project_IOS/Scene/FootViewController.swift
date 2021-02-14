//
//  FootViewController.swift
//  Project_IOS
//
//  Created by Raphael on 07/02/2021.
//

import UIKit

class FootViewController: UIViewController {

    @IBOutlet weak var footTableView: UITableView!
    let footService: FootService = FootService()
    var foot: [Foot] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FOOT"

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleFavorite))

        self.footTableView.dataSource = self
    }

    @objc func handleFavorite(){
            let controller = FavoriteFootViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }

    override func viewWillAppear( _ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)

        self.footService.list { (foots) in
            self.foot = foots
            DispatchQueue.main.sync {
                self.footTableView.reloadData()
            }
        }
    }

}

extension FootViewController: UITableViewDataSource {
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foot.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foot = self.foot[indexPath.row] // recuperer le café à la bonne ligne
        let cell = self.getFootCell(tableView: tableView)
        cell.textLabel?.text = "\(foot.team1.name) : \(foot.team1.score) VS \(foot.team2.score) : \(foot.team2.name)"
        return cell
    }

    func getFootCell(tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "foot_identifier") else {
            return UITableViewCell(style: .default, reuseIdentifier: "foot_identifier")
        }
        return cell
    }
}
