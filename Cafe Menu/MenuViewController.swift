//
//  MenuViewController.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/3/21.
//

import UIKit

class MenuViewController: UIViewController, SectionsToMenuVC {
    
    var sectionsViewController: SectionsViewController?
    var menuListTableViewController: MenuListTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cafe Menu"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToSections" {
            sectionsViewController = segue.destination as? SectionsViewController
            sectionsViewController!.sectionsToMenu = self
        }
        
        if segue.identifier == "ToMenuList" {
            menuListTableViewController = segue.destination as? MenuListTableViewController
            menuListTableViewController!.pickerSelection = (menuSectionStr: "All", menuSectionVal: 0)
        }
        
    }
        
}

extension MenuViewController {
        
    func passSelectedPickerRow(pickerRow: (menuSectionStr: String, menuSectionVal: Int)) {
        menuListTableViewController!.pickerSelection = pickerRow
        menuListTableViewController!.tableView.reloadData()
    }
    
}

