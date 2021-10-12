//
//  MenuViewController.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/3/21.
//

import UIKit

class MenuViewController: UIViewController {
    
    var sectionsViewController: SectionsViewController?
    var menuListTableViewController: MenuListTableViewController?
    var detailVC = DetailViewController()
    
    var addToOrderList: [MenuItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.delegate = self
        detailVC.detailToMenu = self
        title = "Cafe Menu"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToSections" {
            sectionsViewController = segue.destination as? SectionsViewController
            sectionsViewController!.sectionsToMenu = self
        }
        
        if segue.identifier == "ToMenuList" {
            menuListTableViewController = segue.destination as? MenuListTableViewController
            menuListTableViewController!.detailVC = detailVC
        }
    }
        
}

extension MenuViewController: SectionsToMenuVC {
        
    func passSelectedPickerRow(pickerRow: (menuSectionStr: String, menuSectionVal: Int)) {
        menuListTableViewController!.passSelectedPickerRow(pickerRow: pickerRow)
    }
    
}

extension MenuViewController: DetailToMenuVC, UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if viewController.isKind(of: UINavigationController.self) {
            
            guard let destNavController = viewController as? UINavigationController else {
                fatalError("Unable to find UINavigationController")
            }
            
            if destNavController.topViewController!.isKind(of: OrderListTableViewController.self) {

                guard let destVC = destNavController.topViewController as? OrderListTableViewController else {
                    fatalError("Unable to switch to OrderListTableViewController")
                }

                destVC.orderList.append(contentsOf: addToOrderList)
                destVC.tableView.reloadData()
                
                addToOrderList.removeAll()
            }

        }
    }
    
    func addToOrderList(item: MenuItem) {
        addToOrderList.append(item)
    }
    
}

