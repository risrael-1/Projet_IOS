//
//  HomeViewController.swift
//  Project_IOS
//
//  Created by Raphael on 25/01/2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            let chooseSportViewController = ChooseSportViewController(nibName: "ChooseSportViewController", bundle: nil)
            self.navigationController?.pushViewController(chooseSportViewController, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }



}
