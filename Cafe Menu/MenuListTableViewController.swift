//
//  MenuListTableViewController.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/3/21.
//

import UIKit

class MenuListTableViewController: UITableViewController {

    
    let teas = [
        "Black Tea",
        "Green Tea",
        "Oolong Tea"
    ]
    
    let coffees = [
        "Espresso",
        "Macchiato",
        "Latte",
        "Black Coffee"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            print(teas[indexPath.row])
        }
        else if indexPath.section == 1 {
            print(coffees[indexPath.row])
        }
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Tea"
        }
        else if section == 1 {
            return "Coffee"
        }
        
        return nil
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return teas.count
        }
        else if section == 1 {
            return coffees.count
        }
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()

        if indexPath.section == 0 {
            content.text = teas[indexPath.row]
        }
        else if indexPath.section == 1 {
            content.text = coffees[indexPath.row]
        }
        
        cell.contentConfiguration = content
        
        return cell
    }

}
