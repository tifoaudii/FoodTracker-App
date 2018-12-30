//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Tifo Audi Alif Putra on 30/12/18.
//  Copyright © 2018 BCC FILKOM. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var imageMeal: UIImageView!
    @IBOutlet weak var nameMeal: UILabel!
    @IBOutlet weak var ratingMeal: RatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
