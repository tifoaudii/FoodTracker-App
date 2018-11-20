//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Tifo Audi Alif Putra on 20/11/18.
//  Copyright © 2018 BCC FILKOM. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK Properties
    var ratingButtons = [UIButton]()
    var ratingNumber = 0
    
    //allow it to create custom  atribut inspector programmatically
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0)
    @IBInspectable var starCount: Int = 5
    
    override init(frame: CGRect) {
        //init the view
        super.init(frame: frame)
        setupButton()
    }
    
    required init(coder: NSCoder) {
        //after init the view, load it to storyboard
        super.init(coder:coder)
        setupButton()
    }
    
    //MARK Button Action
    @objc func ratingButtonTapped(button: UIButton){
        print("wik wik wik")
    }
    
    private func setupButton(){
        //init button
        for _ in 0..<starCount {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            //add constraint to button
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //add an action to button
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            //add the button to the listview managed by RatingControl stack view
            addArrangedSubview(button)
            
            //add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
    
}
