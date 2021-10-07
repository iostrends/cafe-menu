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
        "Americano",
        "Black Coffee",
        "Caffè mocha",
        "Cappuccino",
        "Espresso",
        "Latte",
        "Macchiato"
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
    var pickerSelection: (menuSectionStr: String, menuSectionVal: Int)?
    
    var detailVC: DetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allMenu = [teas, coffees, pastriesAndDesserts, sandwiches, beverages, cafeSides]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        detailVC = (navController.viewControllers.first as? DetailViewController)!

    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if pickerSelection!.menuSectionStr == "All" {
            print(allMenu[indexPath.section][indexPath.row])
            detailVC?.title = allMenu[indexPath.section][indexPath.row]
        }
        else {
            print(allMenu[pickerSelection!.menuSectionVal - 1][indexPath.row])
            detailVC?.title = allMenu[pickerSelection!.menuSectionVal - 1][indexPath.row]
        }
        
        let customVC = CustomModalViewController()
        customVC.modalPresentationStyle = .overCurrentContext
        self.present(customVC, animated: false)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if pickerSelection!.menuSectionStr == "All" {
           return allMenu.count
        }
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if pickerSelection!.menuSectionStr == "All" {
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
        
        return pickerSelection!.menuSectionStr
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if pickerSelection!.menuSectionStr == "All" {
            return allMenu[section].count
        }
        else {
            return allMenu[pickerSelection!.menuSectionVal - 1].count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()

        if pickerSelection?.menuSectionStr == "All" {
            content.text = allMenu[indexPath.section][indexPath.row]
        }
        else {
            content.text = allMenu[pickerSelection!.menuSectionVal - 1][indexPath.row]
        }

        cell.contentConfiguration = content
        
        return cell
    }

}
