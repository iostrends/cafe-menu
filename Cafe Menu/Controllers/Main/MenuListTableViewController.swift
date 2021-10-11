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

    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        header.textLabel?.frame = header.bounds
    }

//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let verticalPadding: CGFloat = 5
//
//        let maskLayer = CALayer()
//        maskLayer.cornerRadius = 10
//        maskLayer.backgroundColor = UIColor.black.cgColor
//        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 15, dy: verticalPadding/2)
//        cell.layer.mask = maskLayer
//        tableView.backgroundColor = UIColor.systemGroupedBackground
//    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if menuListDataSource.pickerSelection!.menuSectionStr == "All" {
            print(menuListDataSource.allMenuItems[indexPath.section][indexPath.row])
            detailVC!.theMenuItem = menuListDataSource.allMenuItems[indexPath.section][indexPath.row]
        }
        else {
            print(menuListDataSource.allMenuItems[menuListDataSource.pickerSelection!.menuSectionVal - 1][indexPath.row])
            detailVC!.theMenuItem = menuListDataSource.allMenuItems[menuListDataSource.pickerSelection!.menuSectionVal - 1][indexPath.row]
        }
        
        detailVC!.modalPresentationStyle = .overFullScreen
        self.present(detailVC!, animated: false, completion: nil)
    }
    
}


extension MenuListTableViewController {
    
    func passSelectedPickerRow(pickerRow: (menuSectionStr: String, menuSectionVal: Int)) {
        menuListDataSource.pickerSelection = pickerRow
        tableView.reloadData()
    }
    
}
