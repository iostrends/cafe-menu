//
//  SectionsViewController.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/3/21.
//

import UIKit

protocol SectionsToMenuVC {
    func passSelectedRowValue(rowValue: String)
    
}


class SectionsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var sectionsPickerView: UIPickerView!
    var sectionsToMenu: SectionsToMenuVC?
    
    let sections = [
        "All",
        "Teas",
        "Coffees",
        "Pastries and Desserts",
        "Sandwichs",
        "Beverages",
        "Cafe Sides"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    // MARK: UIPickerViewDelegate methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sectionsToMenu?.passSelectedRowValue(rowValue: sections[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sections[row]
    }
    
    
    // MARK: - UIPickerViewDataSource methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sections.count
    }
    
}
