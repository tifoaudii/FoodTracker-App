//
//  Meal.swift
//  FoodTracker
//
//  Created by Tifo Audi Alif Putra on 02/12/18.
//  Copyright © 2018 BCC FILKOM. All rights reserved.
//

import UIKit

class Meal {
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo:UIImage?, rating: Int) {
        
        //check if the input's values are wrong
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
