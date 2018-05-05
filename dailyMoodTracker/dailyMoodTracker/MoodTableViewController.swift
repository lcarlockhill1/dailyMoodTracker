//
//  MoodTableViewController.swift
//  dailyMoodTracker
//
//  Created by LisaBebe11 on 4/27/18.
//  Copyright © 2018 LisaBebe11. All rights reserved.
//

import UIKit

class MoodTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var moods = [Mood]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleMoods()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moods.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MoodTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MoodTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MoodTableViewCell.")
        }
        
        // Fetches the appropriate mood for the data source layout.
        let mood = moods[indexPath.row]
        
        cell.nameLabel.text = mood.name
        cell.photoImageView.image = mood.photo
        cell.ratingControl.rating = mood.rating
        
        return cell
    }
    
    
    
    //MARK: Actions
    
    @IBAction func unwindToMoodlList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MoodViewController, let mood = sourceViewController.mood {
            
            // Add a new mood.
            let newIndexPath = IndexPath(row: moods.count, section: 0)
            
            moods.append(mood)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    //MARK: Private Methods
    
    private func loadSampleMoods() {
        
        let photo1 = UIImage(named: "mood1")
        let photo2 = UIImage(named: "mood2")
        let photo3 = UIImage(named: "mood3")
        
        guard let mood1 = mood(name: "Caprese Salad", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate mood1")
        }
        
        guard let mood2 = mood(name: "Chicken and Potatoes", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate mood2")
        }
        
        guard let mood3 = mood(name: "Pasta with Meatballs", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate mood3")
        }
        
        moods += [mood1, mood2, mood3]
    }
    
}
