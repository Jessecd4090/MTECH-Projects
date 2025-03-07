//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Jestin Dorius on 3/7/25.
//

import UIKit

class FoodTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var meals: [Meal] {
        
        //MARK: BREAKFAST
        let breakfast = Meal(name: "Breakfast", food: [
            Food(
                name: "Waffles",
                description: "Crispy, sweet, and fluffy cakes."),
            
            Food(
                name: "Cereal",
                description: "Crispy, and sweet, pairs well with milk."),
            
            Food(
                name: "'German pancakes'",
                description: "Crispy, rich and fluffy thin styled pancake type food.")])
        
        //MARK: LUNCH
        let lunch = Meal(name: "Lunch", food: [
            Food(
                name: "Sandwhich",
                description: "A delicous ham and turkey sandwhich with olives, lettuce, tomatoes"),
            
            Food(
                name: "Chicken Nuggets",
                description: "Crispy, tender, bite-sized pieces of chicken"),
            
            Food(
                name: "Soup",
                description: "Warm and rich mixture of vegetables and other ingredients")])
        
        //MARK: DINNER
        let dinner = Meal(name: "Dinner", food: [
            Food(
                name: "Steak",
                description: "Steak with a side of potatos and a baked good as well"),
            
            Food(
                name: "Pizza",
                description: "A circular piece of bread covered in tomato sauce and other vegetables"),
            
            Food(
                name: "One-Pot Pasta",
                description: "A creamy, chessy, pasta with cherry tomatos and some slices of sausages, all cooked in one pot")])
        
        return [breakfast, lunch, dinner]
    }
    
    //title for sections
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        meals[section].name
    }
    
    //this function is needed to adjust the font style, it cannot be done in the function above
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //need to get the header title from the other function
        let headerTitle = self.tableView(tableView, titleForHeaderInSection: section)
        
        // this is to create a label to display the header title
        let headerLabel = UILabel()
        headerLabel.text = headerTitle
        //this enables me to be able to adjust the size and weight of the text
        headerLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        headerLabel.textColor = UIColor.black
        
        headerLabel.textAlignment = .left
        
        // this is adding padding to the label
        headerLabel.frame = CGRect(x: 15, y: -15, width: tableView.bounds.width, height: 30)
        
        // now we need to create a container to hold the label
        let headerView = UIView()
        headerView.addSubview(headerLabel)
        return headerView
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        meals.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals[section].food.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meals[indexPath.section]
        
        var configuration = cell.defaultContentConfiguration()
        configuration.text = meal.food[indexPath.row].name
        configuration.secondaryText = "\(meal.food[indexPath.row].description)"
        cell.contentConfiguration = configuration
        
        return cell
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
