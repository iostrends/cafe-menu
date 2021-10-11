//
//  SectionsViewController.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/3/21.
//

import UIKit

protocol SectionsToMenuVC {
    func passSelectedPickerRow(pickerRow: (menuSectionStr: String, menuSectionVal: Int))
}


class SectionsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var sectionsPickerView: UIPickerView!
    var sectionsToMenu: SectionsToMenuVC?
    
    let sections = [
        "All",
        "Tea Collection",
        "Coffee Collection",
        "Pastry and Dessert Collection",
        "Sandwich Collection",
        "Beverage Collection",
        "Cafe Sides Collection"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    // MARK: - UIPickerViewDelegate methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sectionsToMenu!.passSelectedPickerRow(pickerRow:(sections[row], row))
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sections[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerLabel = view as! UILabel?
        
        if view == nil {  //if no label there yet
            pickerLabel = UILabel()
            //color the label's background
            let hue = CGFloat(row)/CGFloat(sections.count)
            pickerLabel!.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 0.7)
        }
        
        pickerLabel?.text = sections[row]
        pickerLabel?.font = .boldSystemFont(ofSize: 20)

        return pickerLabel!
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    
    
    // MARK: - UIPickerViewDataSource methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sections.count
    }
    
}
