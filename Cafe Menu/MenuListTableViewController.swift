//
//  MenuListTableViewController.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/3/21.
//

import UIKit

class MenuListTableViewController: UITableViewController {

    let teas = [
        (
            menuItemStr: "Earl Grey Tea",
            menuItemImg: UIImage(named: "cup-earl-grey-tea"),
            menuItemPriceStr: "$ 2.99",
            menuItemDescriptionStr: "A strong black tea base with the added essence of bergamot, a citrus fruit with subtle lemon and floral lavender notes, creates this aromatically awesome tea flavor."
        ),
        (
            menuItemStr: "Green Tea",
            menuItemImg: UIImage(named: "green-tea"),
            menuItemPriceStr: "$ 3.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Hibiscus Tea",
            menuItemImg: UIImage(named: "hibiscus-tea"),
            menuItemPriceStr: "$ 4.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Orange Blossom Tea",
            menuItemImg: UIImage(named: "orange-blossom-tea"),
            menuItemPriceStr: "$ 5.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Peppermint Tea",
            menuItemImg: UIImage(named: "peppermint-tea"),
            menuItemPriceStr: "$ 3.99",
            menuItemDescriptionStr: ""
        )
    ]
    
    let coffees = [
        (
            menuItemStr: "Americano",
            menuItemImg: UIImage(named: "americano-coffee"),
            menuItemPriceStr: "$ 2.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Black Coffee",
            menuItemImg: UIImage(named: "black-coffee"),
            menuItemPriceStr: "$ 1.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Caffè Peppermint Mocha",
            menuItemImg: UIImage(named: "peppermint-mocha"),
            menuItemPriceStr: "$ 7.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Cappuccino",
            menuItemImg: UIImage(named: "cappuccino"),
            menuItemPriceStr: "$ 4.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Caramel Macchiato",
            menuItemImg: UIImage(named: "caramel-macchiato"),
            menuItemPriceStr: "$ 9.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Espresso",
            menuItemImg: UIImage(named: "espresso"),
            menuItemPriceStr: "$ 5.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Latte",
            menuItemImg: UIImage(named: "latte"),
            menuItemPriceStr: "$ 6.99",
            menuItemDescriptionStr: ""
        )
    ]
    
    let pastriesAndDesserts = [
        (
            menuItemStr: "Cheesecake",
            menuItemImg: UIImage(named: "cheesecake"),
            menuItemPriceStr: "$ 7.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Creme Caramel",
            menuItemImg: UIImage(named: "creme-caramel"),
            menuItemPriceStr: "$ 9.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Lemon Meringue Pie",
            menuItemImg: UIImage(named: "lemon-meringue"),
            menuItemPriceStr: "$ 8.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Tiramisu",
            menuItemImg: UIImage(named: "tiramisu"),
            menuItemPriceStr: "$ 6.99",
            menuItemDescriptionStr: ""
        )
    ]
    
    let sandwiches = [
        (
            menuItemStr: "Chicken Salad Croissant",
            menuItemImg: UIImage(named: "chicken-salad-croissant-sandwich"),
            menuItemPriceStr: "$ 7.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Ham Sandwich",
            menuItemImg: UIImage(named: "ham-sandwich"),
            menuItemPriceStr: "$ 4.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Turkey BLT",
            menuItemImg: UIImage(named: "turkey-blt"),
            menuItemPriceStr: "$ 5.99",
            menuItemDescriptionStr: ""
        )
    ]
    
    let beverages = [
        (
            menuItemStr: "Iced Tea",
            menuItemImg: UIImage(named: "iced-tea"),
            menuItemPriceStr: "$ 4.50",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Lemonade",
            menuItemImg: UIImage(named: "lemonade"),
            menuItemPriceStr: "$ 2.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Orange Juice",
            menuItemImg: UIImage(named: "orange-juice"),
            menuItemPriceStr: "$ 3.99",
            menuItemDescriptionStr: ""
        )
    ]
    
    let cafeSides = [
        (
            menuItemStr: "French Fries",
            menuItemImg: UIImage(named: "french-fries"),
            menuItemPriceStr: "$ 3.99",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Fresh Fruit Salad",
            menuItemImg: UIImage(named: "fruit-salad"),
            menuItemPriceStr: "$ 5.25",
            menuItemDescriptionStr: ""
        ),
        (
            menuItemStr: "Tortilla Chips with Fresh Salsa",
            menuItemImg: UIImage(named: "tortilla-chips-with-salsa"),
            menuItemPriceStr: "$ 4.50",
            menuItemDescriptionStr: ""
        )
    ]
    
    var allMenuItems: [[(menuItemStr: String,
                         menuItemImg: UIImage?,
                         menuItemPriceStr: String,
                         menuItemDescriptionStr: String)]] = [[]]
    
    var pickerSelection: (menuSectionStr: String, menuSectionVal: Int)?
    
    var detailVC: DetailViewController = DetailViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allMenuItems = [teas, coffees, pastriesAndDesserts, sandwiches, beverages, cafeSides]
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if pickerSelection!.menuSectionStr == "All" {
            print(allMenuItems[indexPath.section][indexPath.row])
            
            detailVC.menuItemTitle.text = allMenuItems[indexPath.section][indexPath.row].menuItemStr
            detailVC.menuItemPrice.text = allMenuItems[indexPath.section][indexPath.row].menuItemPriceStr
            
            detailVC.menuItemImageView.image = allMenuItems[indexPath.section][indexPath.row].menuItemImg
            detailVC.menuItemDescription.text = allMenuItems[indexPath.section][indexPath.row].menuItemDescriptionStr
        }
        else {
            print(allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row])
            
            detailVC.menuItemTitle.text = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemStr
            detailVC.menuItemPrice.text = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemPriceStr
            
            detailVC.menuItemImageView.image = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemImg
            detailVC.menuItemDescription.text = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemDescriptionStr
        }
        
        detailVC.modalPresentationStyle = .overCurrentContext
        self.present(detailVC, animated: false, completion: nil)
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
            cell.menuItemImage.image = allMenuItems[indexPath.section][indexPath.row].menuItemImg
            cell.menuItemPriceLabel.text = allMenuItems[indexPath.section][indexPath.row].menuItemPriceStr
        }
        else {
            cell.menuItemLabel.text = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemStr
            cell.menuItemImage.image = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemImg
            cell.menuItemPriceLabel.text = allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemPriceStr
        }
        
        return cell
    }

}
