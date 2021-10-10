//
//  DetailViewController.swift
//  Cafe Menu
//
//  Created by Spruce Tree on 10/5/21.
//

import UIKit

protocol DetailToMenuVC {
    func addToOrderList(item: MenuItem)
}

class DetailViewController: CustomModalViewController {

    var detailToMenu: DetailToMenuVC?
    
    var theMenuItem: MenuItem?
    
    private let menuItemTitle = UILabel()
    private let menuItemPrice = UILabel()
    
    private let menuItemImageView = UIImageView()
    private let menuItemDescription = UITextView()
    
    private let addToOrderButton = UIButton()
    private let closeImageButton = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        menuItemTitle.text = theMenuItem!.menuItemStr
        menuItemPrice.text = theMenuItem!.menuItemPriceStr
        
        menuItemImageView.image = theMenuItem!.menuItemImg
        menuItemDescription.text = theMenuItem!.menuItemDescriptionStr
    }
    
    override func setupView() {
        
        // Pull Tab Control
        let barView = UIView()
        barView.backgroundColor = .systemGray3
        barView.layer.cornerRadius = 3
        
        containerView.addSubview(barView)
        barView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            barView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            barView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            
            barView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 172),
            barView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -172)
        ])
        
        
        // Title Label
        menuItemTitle.font = .boldSystemFont(ofSize: 24)

        containerView.addSubview(menuItemTitle)
        menuItemTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            menuItemTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25),
            menuItemTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15)
        ])

        
        // Price Label
        menuItemPrice.font = .systemFont(ofSize: 20)
        
        containerView.addSubview(menuItemPrice)
        menuItemPrice.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            menuItemPrice.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 65),
            menuItemPrice.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15)
        ])

        
        // Image
        menuItemImageView.layer.cornerRadius = 10
        menuItemImageView.layer.masksToBounds = true

        containerView.addSubview(menuItemImageView)
        menuItemImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            menuItemImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 105),
            menuItemImageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 300),
            
            menuItemImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            menuItemImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -180)
        ])
        
        
        // Description
        menuItemDescription.font = .systemFont(ofSize: 18)
        
        containerView.addSubview(menuItemDescription)
        menuItemDescription.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            menuItemDescription.topAnchor.constraint(equalTo: menuItemImageView.topAnchor, constant: -45),
            menuItemDescription.bottomAnchor.constraint(equalTo: menuItemImageView.bottomAnchor, constant: 0),

            menuItemDescription.leadingAnchor.constraint(equalTo: menuItemImageView.trailingAnchor, constant: 10),
            menuItemDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        ])
        
        
        // Background around the "Add To Order" button
        let smallView = UIView()
        smallView.backgroundColor = UIColor(red:103/255, green:247/255, blue: 215/255, alpha: 0.3)
        
        containerView.addSubview(smallView)
        smallView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            smallView.topAnchor.constraint(equalTo: menuItemImageView.bottomAnchor, constant: 10),
            smallView.bottomAnchor.constraint(equalTo: menuItemImageView.bottomAnchor, constant: 150),
            
            smallView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            smallView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)
        ])
        
        
        // "Add To Order" Button
        addToOrderButton.setTitle("Add To Order", for: .normal)
        addToOrderButton.setTitleColor(.black, for: .normal)
        addToOrderButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        addToOrderButton.backgroundColor = UIColor(red: 29/255, green: 247/255, blue: 199/255, alpha: 0.7)
        addToOrderButton.layer.cornerRadius = 10
        
        addToOrderButton.addTarget(self, action: #selector(addMenuItemToOrder), for: .touchUpInside)

        smallView.addSubview(addToOrderButton)
        addToOrderButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            addToOrderButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 325),
            addToOrderButton.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 375),
            
            addToOrderButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 25),
            addToOrderButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -25)
        ])
        
        
        // Close Modal Button
        closeImageButton.image = UIImage(named: "custom.xmark.circle.fill")
        closeImageButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeDetailModal)))
        closeImageButton.isUserInteractionEnabled = true
        
        containerView.addSubview(closeImageButton)
        closeImageButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            closeImageButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            closeImageButton.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 48),
            
            closeImageButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 340),
            closeImageButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])

    }
    
    @objc
    func addMenuItemToOrder() {
        print("addToOrder")
        print(theMenuItem!.menuItemStr)
        detailToMenu!.addToOrderList(item: theMenuItem!)
    }
    
    
    @objc
    func closeDetailModal() {
        animateDismissView()
    }

}
