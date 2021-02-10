//
//  HomeViewController.swift
//  Project_IOS
//
//  Created by Raphael on 25/01/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.imageView.image = UIImage(named:"basket1.jpg")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.imageView.image = UIImage(named:"football.jpg")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            print()
            let chooseSportViewController = ChooseSportViewController(nibName: "ChooseSportViewController", bundle: nil)
            self.navigationController?.pushViewController(chooseSportViewController, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }



}
