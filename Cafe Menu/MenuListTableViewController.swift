//
//  MenuListTableViewController.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/3/21.
//

import UIKit

class MenuListTableViewController: UITableViewController {

    let teas = [
        (menuItemStr: "Earl Grey Tea", menuItemImage: UIImage(named: "cup-earl-grey-tea"), menuItemPrice: "$ 2.99"),
        (menuItemStr: "Green Tea", menuItemImage: UIImage(named: "green-tea"), menuItemPrice: "$ 3.99"),
        (menuItemStr: "Hibiscus Tea", menuItemImage: UIImage(named: "hibiscus-tea"), menuItemPrice: "$ 4.99"),
        (menuItemStr: "Orange Blossom Tea", menuItemImage: UIImage(named: "orange-blossom-tea"), menuItemPrice: "$ 5.99"),
        (menuItemStr: "Peppermint Tea", menuItemImage: UIImage(named: "peppermint-tea"), menuItemPrice: "$ 3.99")
    ]
    
    let coffees = [
        (menuItemStr: "Americano", menuItemImage: UIImage(named: "americano-coffee"), menuItemPrice: "$ 2.99"),
        (menuItemStr: "Black Coffee", menuItemImage: UIImage(named: "black-coffee"), menuItemPrice: "$ 1.99"),
        (menuItemStr: "Caffè Peppermint Mocha", menuItemImage: UIImage(named: "peppermint-mocha"), menuItemPrice: "$ 7.99"),
        (menuItemStr: "Cappuccino", menuItemImage: UIImage(named: "cappuccino"), menuItemPrice: "$ 4.99"),
        (menuItemStr: "Caramel Macchiato", menuItemImage: UIImage(named: "caramel-macchiato"), menuItemPrice: "$ 9.99"),
        (menuItemStr: "Espresso", menuItemImage: UIImage(named: "espresso"), menuItemPrice: "$ 5.99"),
        (menuItemStr: "Latte", menuItemImage: UIImage(named: "latte"), menuItemPrice: "$ 6.99")
    ]
    
    let pastriesAndDesserts = [
        (menuItemStr: "Cheesecake", menuItemImage: UIImage(named: "cheesecake"), menuItemPrice: "$ 7.99"),
        (menuItemStr: "Creme Caramel", menuItemImage: UIImage(named: "creme-caramel"), menuItemPrice: "$ 9.99"),
        (menuItemStr: "Lemon Meringue Pie", menuItemImage: UIImage(named: "lemon-meringue"), menuItemPrice: "$ 8.99"),
        (menuItemStr: "Tiramisu", menuItemImage: UIImage(named: "tiramisu"), menuItemPrice: "$ 6.99")
    ]
    
    let sandwiches = [
        (menuItemStr: "Chicken Salad Croissant", menuItemImage: UIImage(named: "chicken-salad-croissant-sandwich"), menuItemPrice: "$ 7.99"),
        (menuItemStr: "Ham Sandwich", menuItemImage: UIImage(named: "ham-sandwich"), menuItemPrice: "$ 4.99"),
        (menuItemStr: "Turkey BLT", menuItemImage: UIImage(named: "turkey-blt"), menuItemPrice: "$ 5.99")
    ]
    
    let beverages = [
        (menuItemStr: "Iced Tea", menuItemImage: UIImage(named: "iced-tea"), menuItemPrice: "$ 4.50"),
        (menuItemStr: "Lemonade", menuItemImage: UIImage(named: "lemonade"), menuItemPrice: "$ 2.99"),
        (menuItemStr: "Orange Juice", menuItemImage: UIImage(named: "orange-juice"), menuItemPrice: "$ 3.99")
    ]
    
    let cafeSides = [
        (menuItemStr: "French Fries", menuItemImage: UIImage(named: "french-fries"), menuItemPrice: "$ 3.99"),
        (menuItemStr: "Fresh Fruit Salad", menuItemImage: UIImage(named: "fruit-salad"), menuItemPrice: "$ 5.25"),
        (menuItemStr: "Tortilla Chips with Fresh Salsa", menuItemImage: UIImage(named: "tortilla-chips-with-salsa"), menuItemPrice: "$ 4.50")
    ]
    
    var allMenuItems: [[(menuItemStr: String, menuItemImage: UIImage?, menuItemPrice: String)]] = [[]]
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
            detailVC?.title = allMenuItems[indexPath.section][indexPath.row].menuItemStr
        }
        else {
            print(allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row])
            detailVC?.title = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemStr
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
            cell.menuItemLabel.text = allMenuItems[indexPath.section][indexPath.row].menuItemStr
            cell.menuItemImage.image = allMenuItems[indexPath.section][indexPath.row].menuItemImage
            cell.menuItemPriceLabel.text = allMenuItems[indexPath.section][indexPath.row].menuItemPrice
        }
        else {
            cell.menuItemLabel.text = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemStr
            cell.menuItemImage.image = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemImage
            cell.menuItemPriceLabel.text = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemPrice
        }
        
        return cell
    }

}
