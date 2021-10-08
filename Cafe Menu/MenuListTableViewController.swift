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
    
    var allMenuItems: [[String]] = [[]]
    var allMenuItemImageNames: [[String]] = [[]]
    var pickerSelection: (menuSectionStr: String, menuSectionVal: Int)?
    
    var detailVC: DetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allMenuItems = [teas, coffees, pastriesAndDesserts, sandwiches, beverages, cafeSides]
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        detailVC = (navController.viewControllers.first as? DetailViewController)!

    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if pickerSelection!.menuSectionStr == "All" {
            print(allMenuItems[indexPath.section][indexPath.row])
            detailVC?.title = allMenuItems[indexPath.section][indexPath.row]
        }
        else {
            print(allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row])
            detailVC?.title = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row]
        }
        
        let customVC = CustomModalViewController()
        customVC.modalPresentationStyle = .overCurrentContext
        self.present(customVC, animated: false)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if pickerSelection!.menuSectionStr == "All" {
           return allMenuItems.count
        }
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if pickerSelection!.menuSectionStr == "All" {
            if section == 0 {
                return "Tea Collection"
            }
            else if section == 1 {
                return "Coffee Collection"
            }
            else if section == 2 {
                return "Pastrie and Dessert Collection"
            }
            else if section == 3 {
                return "Sandwich Collection"
            }
            else if section == 4 {
                return "Beverage Collection"
            }
            else if section == 5 {
                return "Cafe Sides Collection"
            }
        }
        
        return pickerSelection!.menuSectionStr
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if pickerSelection!.menuSectionStr == "All" {
            return allMenuItems[section].count
        }
        else {
            return allMenuItems[pickerSelection!.menuSectionVal - 1].count
        }
        
    }


    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        header.textLabel?.frame = header.bounds
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 5

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 15, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
        tableView.backgroundColor = UIColor.systemGroupedBackground
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "menuItemCell", for: indexPath) as? MenuItemTableViewCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
    
        if pickerSelection?.menuSectionStr == "All" {
            cell.menuItemLabel.text = allMenuItems[indexPath.section][indexPath.row]
            cell.menuItemImage.image = UIImage(named: "cup-earl-grey-tea")
            cell.menuItemPriceLabel.text = "$ 7"
        }
        else {
            cell.menuItemLabel.text = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row]
            cell.menuItemImage.image = UIImage(named: "cup-earl-grey-tea")
            cell.menuItemPriceLabel.text = "$ 7"
        }
        
        return cell
    }

}
