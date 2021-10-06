//
//  MenuListTableViewController.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/3/21.
//

import UIKit

class MenuListTableViewController: UITableViewController {

    let teas = [
        "Earl Grey",
        "Orange Blossom",
        "Green Tea",
        "Peppermint Tea",
        "Orange Hibiscus",
        "Darjeeling"
    ]
    
    let coffees = [
        "Espresso",
        "Macchiato",
        "Latte",
        "Cappuccino",
        "Black Coffee",
        "Americano"
    ]
    
    let pastriesAndDesserts = [
        "Tirmaisu",
        "Pineapple Cheescake",
        "Creme Carmel",
        "Lemon Meringue Pie"
    ]
    
    let sandwiches = [
        "Chicken Salad Croissant",
        "Turkey BLT",
        "Ham Sandwhich"
    ]
    
    let beverages = [
        "Orange Juice",
        "Iced Tea",
        "Lemonade"
    ]
    
    let cafeSides = [
        "French Fries",
        "Tortilla Chips with Fresh Salsa",
        "Fresh Fruit Salad"
    ]
    
    var allMenu: [[String]] = [[]]
    var pickerSelection: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        allMenu = [teas, coffees, pastriesAndDesserts, sandwiches, beverages, cafeSides]
    }

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(allMenu[indexPath.section][indexPath.row])
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if pickerSelection == "All" {
           return allMenu.count
        }
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if pickerSelection == "All" {
            if section == 0 {
                return "Teas"
            }
            else if section == 1 {
                return "Coffees"
            }
            else if section == 2 {
                return "Pastries and Desserts"
            }
            else if section == 3 {
                return "Sandwiches"
            }
            else if section == 4 {
                return "Beverages"
            }
            else if section == 5 {
                return "Cafe Sides"
            }
        }
        
        return pickerSelection
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMenu[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()

        content.text = allMenu[indexPath.section][indexPath.row]
        
        cell.contentConfiguration = content
        
        return cell
    }

}
