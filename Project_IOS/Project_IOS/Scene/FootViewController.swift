//
//  FootViewController.swift
//  Project_IOS
//
//  Created by Raphael on 07/02/2021.
//

import UIKit

class FootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FOOT"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleFavorite))
    }
    
    @objc func handleFavorite(){
            let controller = FavoriteFootViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
