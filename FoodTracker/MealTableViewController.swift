//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Tifo Audi Alif Putra on 30/12/18.
//  Copyright © 2018 BCC FILKOM. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    var meals = [Meal]()
    
    private func loadMeal(){
        //load meal's photos
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        //instatiate meal object
        guard let meal1 = Meal(name: "Pasta", photo: photo1, rating: 0) else {
            fatalError("Cannot create meal")
        }
        
        guard let meal2 = Meal(name: "Bakso", photo: photo2, rating: 4) else {
            fatalError("Cannot create meal")
        }
        
        guard let meal3 = Meal(name: "Pizza", photo: photo3, rating: 5) else {
            fatalError("Cannot create meal")
        }
        
        meals += [meal1,meal2,meal3]
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load sample meal
        loadMeal()
    }

    // MARK: - Table view data source
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let meal = meals[indexPath.row]
        
        cell.nameMeal.text = meal.name
        cell.imageMeal.image = meal.photo
        cell.ratingMeal.ratingNumber = meal.rating

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
