//
//  MenuListDataSource.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/10/21.
//

import UIKit

class MenuListDataSource: NSObject {

    private let teaCollection = [
        MenuItem(itemStr: "Earl Grey Tea", priceStr: "$ 2.50", itemImg: UIImage(named: "cup-earl-grey-tea")!, desciptionStr: "A strong black tea base with the added essence of bergamot, a citrus fruit with subtle lemon and floral lavender notes, creates this aromatically awesome tea flavor."),
        MenuItem(itemStr: "Green Tea", priceStr: "$ 3.75", itemImg: UIImage(named: "green-tea")!, desciptionStr: ""),
        MenuItem(itemStr: "Hibiscus Tea", priceStr: "$ 4.99", itemImg: UIImage(named: "hibiscus-tea")!, desciptionStr: ""),
        MenuItem(itemStr: "Orange Blossom Tea", priceStr: "$ 5.25", itemImg: UIImage(named: "orange-blossom-tea")!, desciptionStr: ""),
        MenuItem(itemStr: "Peppermint Tea", priceStr: "$ 3.99", itemImg: UIImage(named: "peppermint-tea")!, desciptionStr: "")
    ]
    
    private let coffeeCollection = [
        MenuItem(itemStr: "Americano", priceStr: "$ 2.50", itemImg: UIImage(named: "americano-coffee")!, desciptionStr: ""),
        MenuItem(itemStr: "Black Coffee", priceStr: "$ 1.99", itemImg: UIImage(named: "black-coffee")!, desciptionStr: ""),
        MenuItem(itemStr: "Caffè Peppermint Mocha", priceStr: "$ 7.50", itemImg: UIImage(named: "peppermint-mocha")!, desciptionStr: ""),
        MenuItem(itemStr: "Cappuccino", priceStr: "$ 4.75", itemImg: UIImage(named: "cappuccino")!, desciptionStr: ""),
        MenuItem(itemStr: "Caramel Macchiato", priceStr: "$ 8.25", itemImg: UIImage(named: "caramel-macchiato")!, desciptionStr: ""),
        MenuItem(itemStr: "Espresso", priceStr: "$ 5.99", itemImg: UIImage(named: "espresso")!, desciptionStr: ""),
        MenuItem(itemStr: "Latte", priceStr: "$ 6.25", itemImg: UIImage(named: "latte")!, desciptionStr: "")
    ]
    
    private let pastryAndDessertCollection = [
        MenuItem(itemStr: "Cheesecake", priceStr: "$ 7.75", itemImg: UIImage(named: "cheesecake")!, desciptionStr: ""),
        MenuItem(itemStr: "Creme Caramel", priceStr: "$ 9.50", itemImg: UIImage(named: "creme-caramel")!, desciptionStr: ""),
        MenuItem(itemStr: "Lemon Meringue Pie", priceStr: "$ 8.25", itemImg: UIImage(named: "lemon-meringue")!, desciptionStr: ""),
        MenuItem(itemStr: "Tiramisu", priceStr: "$ 6.25", itemImg: UIImage(named: "tiramisu")!, desciptionStr: "")
    ]
    
    private let sandwichCollection = [
        MenuItem(itemStr: "Chicken Salad Croissant", priceStr: "$ 7.25", itemImg: UIImage(named: "chicken-salad-croissant-sandwich")!, desciptionStr: ""),
        MenuItem(itemStr: "Ham Sandwich", priceStr: "$ 4.50", itemImg: UIImage(named: "ham-sandwich")!, desciptionStr: ""),
        MenuItem(itemStr: "Turkey BLT", priceStr: "$ 5.99", itemImg: UIImage(named: "turkey-blt")!, desciptionStr: "")
    ]
    
    private let beverageCollection = [
        MenuItem(itemStr: "Iced Tea", priceStr: "$ 4.50", itemImg: UIImage(named: "iced-tea")!, desciptionStr: ""),
        MenuItem(itemStr: "Lemonade", priceStr: "$ 2.99", itemImg: UIImage(named: "lemonade")!, desciptionStr: ""),
        MenuItem(itemStr: "Orange Juice", priceStr: "$ 3.25", itemImg: UIImage(named: "orange-juice")!, desciptionStr: "")
    ]
    
    private let cafeSidesCollection = [
        MenuItem(itemStr: "French Fries", priceStr: "$ 3.99", itemImg: UIImage(named: "french-fries")!, desciptionStr: ""),
        MenuItem(itemStr: "Fresh Fruit Salad", priceStr: "$ 5.25", itemImg: UIImage(named: "fruit-salad")!, desciptionStr: ""),
        MenuItem(itemStr: "Tortilla Chips with Fresh Salsa", priceStr: "$ 4.50", itemImg: UIImage(named: "tortilla-chips-with-salsa")!, desciptionStr: "")
    ]
    
    let allMenuItems: [[MenuItem]]
    var pickerSelection: (menuSectionStr: String, menuSectionVal: Int)?
    
    override init() {
        allMenuItems = [teaCollection, coffeeCollection, pastryAndDessertCollection, sandwichCollection, beverageCollection, cafeSidesCollection]
        pickerSelection = (menuSectionStr: "All", menuSectionVal: 0)
        
        super.init()
    }
    
}


extension MenuListDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if pickerSelection!.menuSectionStr == "All" {
           return allMenuItems.count
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if pickerSelection!.menuSectionStr == "All" {
            if section == 0 {
                return "Tea Collection"
            }
            else if section == 1 {
                return "Coffee Collection"
            }
            else if section == 2 {
                return "Pastry and Dessert Collection"
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if pickerSelection!.menuSectionStr == "All" {
            return allMenuItems[section].count
        }
        else {
            return allMenuItems[pickerSelection!.menuSectionVal - 1].count
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "menuItemCell", for: indexPath) as? MenuItemTableViewCell else {
            fatalError("Unable to dequeue menuItemCell")
        }
    
        if pickerSelection?.menuSectionStr == "All" {
            cell.populateMenuItemCell(itemImg: allMenuItems[indexPath.section][indexPath.row].menuItemImg,
                                      itemLabelStr: allMenuItems[indexPath.section][indexPath.row].menuItemStr,
                                      itemPriceStr: allMenuItems[indexPath.section][indexPath.row].menuItemPriceStr)
        }
        else {
            cell.populateMenuItemCell(itemImg: allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemImg,
                                      itemLabelStr: allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemStr,
                                      itemPriceStr: allMenuItems[pickerSelection!.menuSectionVal - 1][indexPath.row].menuItemPriceStr)
        }
        
        return cell
    }

    
}
