//
//  MenuItem.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/10/21.
//

import UIKit

class MenuItem {
    
    var menuItemStr: String
    var menuItemPriceStr: String
    var menuItemImg: UIImage
    var menuItemDescriptionStr: String
    
    init() {
        self.menuItemStr = ""
        self.menuItemPriceStr = ""
        self.menuItemImg = UIImage()
        self.menuItemDescriptionStr = ""
    }
    
    init(itemStr: String, priceStr: String, itemImg: UIImage, desciptionStr: String) {
        self.menuItemStr = itemStr
        self.menuItemPriceStr = priceStr
        self.menuItemImg = itemImg
        self.menuItemDescriptionStr = desciptionStr
    }
}
