//
//  ChooseSportViewController.swift
//  Project_IOS
//
//  Created by Raphael on 25/01/2021.
//

import UIKit

class ChooseSportViewController: UIViewController {

    @IBOutlet weak var ChooseSportLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let chooseText = NSLocalizedString("controller.chooseSport.title", comment: "")
                self.ChooseSportLabel.text = " \(chooseText)"
    }

    @IBAction func footButton(_ sender: Any) {
        let footViewController = FootViewController()
        self.navigationController?.pushViewController(footViewController, animated: true)
    }
    
    @IBAction func basketButton(_ sender: Any) {
        let basketViewController = BasketViewController()
        self.navigationController?.pushViewController(basketViewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
