//
//  MenuListTableViewController.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/3/21.
//

import UIKit

class MenuListTableViewController: UITableViewController {
    
    private var menuListDataSource = MenuListDataSource()
    
    var detailVC: DetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = menuListDataSource
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if menuListDataSource.pickerSelection!.menuSectionStr == "All" {
            print(menuListDataSource.allMenuItems[indexPath.section][indexPath.row])
            detailVC!.theMenuItem = menuListDataSource.allMenuItems[indexPath.section][indexPath.row]
        }
        else {
            print(menuListDataSource.allMenuItems[menuListDataSource.pickerSelection!.menuSectionVal - 1][indexPath.row])
            detailVC!.theMenuItem = menuListDataSource.allMenuItems[menuListDataSource.pickerSelection!.menuSectionVal - 1][indexPath.row]
        }
        
        detailVC!.modalPresentationStyle = .overCurrentContext
        self.present(detailVC!, animated: false, completion: nil)
    }
    
}


extension MenuListTableViewController {
    
    func passSelectedPickerRow(pickerRow: (menuSectionStr: String, menuSectionVal: Int)) {
        menuListDataSource.pickerSelection = pickerRow
        tableView.reloadData()
    }
}
