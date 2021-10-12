//
//  OrderListTableViewController.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/9/21.
//

import UIKit

class OrderListTableViewController: UITableViewController {

    var orderList: [MenuItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Order List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRows = \(orderList.count)")
        return orderList.count
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
            fatalError("Unable to dequeue menuItemCell")
        }

        cell.populateMenuItemCell(itemImg: orderList[indexPath.row].menuItemImg,
                                  itemLabelStr: orderList[indexPath.row].menuItemStr,
                                  itemPriceStr: orderList[indexPath.row].menuItemPriceStr)

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            orderList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
