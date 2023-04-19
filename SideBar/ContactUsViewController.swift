//
//  ContactUsViewController.swift
//  SideBar
//
//  Created by Chandrakant Shingala on 12/04/23.
//

import UIKit

class ContactUsViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var sideMenuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            sideMenuButton.target = self.revealViewController()
            sideMenuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
}
