//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Tifo Audi Alif Putra on 14/11/18.
//  Copyright © 2018 BCC FILKOM. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    //MARK : testcase
    func testMealInitializationSucceds(){
        //testcase for zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        //check the return object is not nil
        XCTAssertNotNil(zeroRatingMeal)
        
        //testcase for max rating
        let maxRatingMeal = Meal.init(name: "Max", photo: nil, rating: 5)
        //check the return object is not nil
        XCTAssertNotNil(maxRatingMeal)
    }
    
    func testMealInitializationFails(){
        //testcase negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        //check the return object is nil
        XCTAssertNil(negativeRatingMeal)
        
        //testcase empty meal's name
        let emptyMealName = Meal.init(name: "", photo: nil, rating: 0)
        //check the return object is not nil
        XCTAssertNil(emptyMealName)
    }

}
