//
//  FavoriteBasketViewController.swift
//  Project_IOS
//
//  Created by Raphael on 07/02/2021.
//

import UIKit

class FavoriteBasketViewController: UIViewController {
    
    @IBOutlet weak var favouriteBasketTableView: UITableView!
    let favouriteBasketService: FavouriteBasketService = FavouriteBasketService()
    var favourites: [FavouriteBasket] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("controller.favorites.title", comment: "")
        
        
        self.favouriteBasketTableView.dataSource = self
    }

    
    
    override func viewWillAppear( _ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)

        self.favouriteBasketService.list { (favs) in
            self.favourites = favs
            DispatchQueue.main.sync {
                self.favouriteBasketTableView.reloadData()
            }
        }
    }

}

extension FavoriteBasketViewController: UITableViewDataSource {
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favourites.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favourites = self.favourites[indexPath.row] // recuperer le café à la bonne ligne
        let cell = self.getFootCell(tableView: tableView)
        cell.textLabel?.text = "\(favourites.team1.name) : \(favourites.team1.score) VS \(favourites.team2.score) : \(favourites.team2.name)"
        return cell
    }

    func getFootCell(tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favourite_identifier") else {
            return UITableViewCell(style: .default, reuseIdentifier: "favourite_identifier")
        }
        return cell
    }
}

extension FavoriteBasketViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let coffee = self.coffees[indexPath.row] // recuperer le café à la bonne ligne
//        let controller = ProductViewController.newInstance(coffee: coffee)
//        self.navigationController?.pushViewController(controller, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let fav = self.favourites[indexPath.row]
        guard let id = fav.id else {
            return
        }
        self.favouriteBasketService.delete(id: id) { (success) in
            if success {
                DispatchQueue.main.sync {
                    self.favourites.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
            }
        }
    }
}
