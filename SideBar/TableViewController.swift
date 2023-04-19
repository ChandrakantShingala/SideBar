//
//  TableViewController.swift
//  SideBar
//
//  Created by Chandrakant Shingala on 12/04/23.
//

import UIKit

struct Option {
    var name: String
    var image: String
}

class TableViewController: UITableViewController {
    
    // MARK: - Variables
    var arrOption: [Option] = []
    var selectedIndex: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadOption()
    }
    
   private func loadOption(){
       let blankOption: Option = Option(name: "", image: "")
       let homeOption: Option = Option(name: "Home", image: "fireplace")
       let aboutUsOption: Option = Option(name: "About Us", image: "fireplace")
       let contactUsOption: Option = Option(name: "Contact Us", image: "fireplace")
       arrOption = [blankOption, homeOption, aboutUsOption, contactUsOption]
       tableView.delegate = self
       tableView.dataSource = self
       tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOption.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.selectionStyle = .none
        if selectedIndex == indexPath.row{
            cell.textLabel?.textColor = .red
        } else {
            cell.textLabel?.textColor = .white
        }
        cell.textLabel?.text = arrOption[indexPath.row].name
        cell.imageView?.image = UIImage(named: arrOption[indexPath.row].image)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        tableView.reloadData()
        switch indexPath.row{
        case 0,1: performSegue(withIdentifier: "home", sender: nil)
        case 2: performSegue(withIdentifier: "aboutUs", sender: nil)
        case 3: performSegue(withIdentifier: "contactUs", sender: nil)
        default: performSegue(withIdentifier: "home", sender: nil)
        }
    }
}
