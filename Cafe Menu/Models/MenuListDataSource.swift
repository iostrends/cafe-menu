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
        MenuItem(itemStr: "Green Tea", priceStr: "$ 3.75", itemImg: UIImage(named: "green-tea")!, desciptionStr: "Green tea blended with mint, lemongrass and lemon verbena."),
        MenuItem(itemStr: "Hibiscus Tea", priceStr: "$ 3.99", itemImg: UIImage(named: "hibiscus-tea")!, desciptionStr: "A refreshing iced tea made with Nigerian hibiscus, apple pieces, sweet blackberry leaves, rosehips, natural plum flavor, carob and ginger."),
        MenuItem(itemStr: "Orange Blossom Tea", priceStr: "$ 4.25", itemImg: UIImage(named: "orange-blossom-tea")!, desciptionStr: "A luscious and rich black tea, teeming with notes of orange, vanilla, bergamot, and jasmine blossoms."),
        MenuItem(itemStr: "Peppermint Tea", priceStr: "$ 3.99", itemImg: UIImage(named: "peppermint-tea")!, desciptionStr: "A blend of mint and a pinch of lemon verbena creates a refreshing flavor.")
    ]
    
    private let coffeeCollection = [
        MenuItem(itemStr: "Americano", priceStr: "$ 2.50", itemImg: UIImage(named: "americano-coffee")!, desciptionStr: "Espresso shots topped with hot water create a light layer of crema."),
        MenuItem(itemStr: "Black Coffee", priceStr: "$ 1.99", itemImg: UIImage(named: "black-coffee")!, desciptionStr: "Full-bodied dark roast coffee with bold, robust flavors."),
        MenuItem(itemStr: "Caffè Peppermint Mocha", priceStr: "$ 7.50", itemImg: UIImage(named: "peppermint-mocha")!, desciptionStr: "Signature Espresso Roast combines with steamed milk, sweet mocha sauce, peppermint-flavored syrup, topped with whipped cream and dark chocolate curls."),
        MenuItem(itemStr: "Cappuccino", priceStr: "$ 4.75", itemImg: UIImage(named: "cappuccino")!, desciptionStr: "Dark, rich espresso lies in wait under a smoothed and stretched layer of thick milk foam."),
        MenuItem(itemStr: "Caramel Macchiato", priceStr: "$ 8.25", itemImg: UIImage(named: "caramel-macchiato")!, desciptionStr: "Freshly steamed milk with vanilla-flavored syrup marked with espresso and topped with a caramel drizzle."),
        MenuItem(itemStr: "Espresso", priceStr: "$ 5.99", itemImg: UIImage(named: "espresso")!, desciptionStr: "Smooth signature Espresso Roast with rich flavor and caramelly sweetness."),
        MenuItem(itemStr: "Caffè Latte", priceStr: "$ 6.25", itemImg: UIImage(named: "latte")!, desciptionStr: "Dark, rich espresso balanced with steamed milk and a light layer of foam.")
    ]
    
    private let pastryAndDessertCollection = [
        MenuItem(itemStr: "Cheesecake", priceStr: "$ 7.75", itemImg: UIImage(named: "cheesecake")!, desciptionStr: "A rich and creamy New York-style cheesecake baked inside a honey-graham crust."),
        MenuItem(itemStr: "Creme Caramel", priceStr: "$ 9.50", itemImg: UIImage(named: "creme-caramel")!, desciptionStr: "Silky smooth custard, boasting the flavor of pure vanilla and topped with a glossy caramel layer."),
        MenuItem(itemStr: "Lemon Meringue Pie", priceStr: "$ 8.25", itemImg: UIImage(named: "lemon-meringue")!, desciptionStr: "Tart and sweet lemon filling, topped with delicate meringue."),
        MenuItem(itemStr: "Tiramisu", priceStr: "$ 6.25", itemImg: UIImage(named: "tiramisu")!, desciptionStr: "Italian Custard Made with Mascarpone, Whipped Cream, Lady Fingers, Marsala and Coffee Liqueur. Topped with Whipped Cream and Ground Chocolate.")
    ]
    
    private let sandwichCollection = [
        MenuItem(itemStr: "Chicken Salad Croissant", priceStr: "$ 7.25", itemImg: UIImage(named: "chicken-salad-croissant-sandwich")!, desciptionStr: "Light and creamy, tangy, and crunchy, chicken salad sandwiched between two halves of a soft buttery croissant!"),
        MenuItem(itemStr: "Ham Sandwich", priceStr: "$ 4.50", itemImg: UIImage(named: "ham-sandwich")!, desciptionStr: "Honey Baked Ham topped with Swiss cheese, lettuce, tomato, mayonnaise, and Hickory Honey Mustard."),
        MenuItem(itemStr: "Turkey BLT", priceStr: "$ 5.99", itemImg: UIImage(named: "turkey-blt")!, desciptionStr: "Choice of Smoked or Roasted Honey Baked Turkey Breast topped with Swiss cheese, lettuce, tomato, mayonnaise, and Hickory Honey Mustard.")
    ]
    
    private let beverageCollection = [
        MenuItem(itemStr: "Iced Black Tea", priceStr: "$ 4.50", itemImg: UIImage(named: "iced-tea")!, desciptionStr: "Premium black tea is shaken with ice."),
        MenuItem(itemStr: "Lemonade", priceStr: "$ 2.99", itemImg: UIImage(named: "lemonade")!, desciptionStr: "Sweet and simple classic lemonade."),
        MenuItem(itemStr: "Orange Juice", priceStr: "$ 3.25", itemImg: UIImage(named: "orange-juice")!, desciptionStr: "Cold-pressed with oranges picked and squeezed at their peak of sweetness.")
    ]
    
    private let cafeSidesCollection = [
        MenuItem(itemStr: "French Fries", priceStr: "$ 3.99", itemImg: UIImage(named: "french-fries")!, desciptionStr: "Made with fresh Aussie potatoes, cooked with their skins on cottonseed sunflower oil blend and ready to be enjoyed with any of our dipping sauces."),
        MenuItem(itemStr: "Fresh Fruit Salad", priceStr: "$ 5.25", itemImg: UIImage(named: "fruit-salad")!, desciptionStr: "An assortment of ripe seasonal fruit with a splash of freshly squeezed orange juice."),
        MenuItem(itemStr: "Tortilla Chips with Fresh Salsa", priceStr: "$ 4.50", itemImg: UIImage(named: "tortilla-chips-with-salsa")!, desciptionStr: "Tortilla chips prepared fresh daily with a light sprinkling of all-natural sea salt.")
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
