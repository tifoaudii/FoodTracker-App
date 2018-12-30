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
    var ratingNumber = 0 {
        didSet {
            updateButtonState()
        }
    }
    
    //allow it to create custom  atribut inspector programmatically
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        //add observer property to observe and changes in property's value
        didSet {
            setupButton()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            //add observer property to observe and changes in property's value
            setupButton()
        }
    }
    
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
    
    private func setupButton(){
        //remove existing button
        clearExistingButtons()
        
        //init button
        initButton()
    }
    
    func initButton(){
        //load image
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filled-star", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "empty-star", in: bundle, compatibleWith: self.traitCollection)
        let colorStar = UIImage(named: "color-star", in: bundle, compatibleWith: self.traitCollection)
        
        //create list of button
        for _ in 0..<starCount {
            let button = UIButton()
            
            //set button to images
            button.setImage(filledStar, for: .selected)
            button.setImage(emptyStar, for: .normal)
            button.setImage(colorStar, for: [.highlighted,.selected])
            
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
        updateButtonState()
    }
    
    //MARK Button Action
    @objc func ratingButtonTapped(button: UIButton){
        guard let indexButton = ratingButtons.index(of: button) else {
            fatalError("The Button, \(button) is not one of the rating buttons ")
        }
        
        let selectedRating = 1 + indexButton;
        if selectedRating == ratingNumber {
            ratingNumber = 0;
        } else {
            ratingNumber = selectedRating
        }
    }
    
    private func updateButtonState() {
        for(index,button) in ratingButtons.enumerated(){
            button.isSelected = index < ratingNumber
        }
        
    }
    
    private func clearExistingButtons(){
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
    }
    
}
