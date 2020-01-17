//
//  InitialTableViewController.swift
//  TableViewControllers
//
//  Created by Nicholas Zufelt on 1/13/20.
//  Copyright © 2020 Nicholas Zufelt. All rights reserved.
//

import UIKit
import Foundation // For UserDefaults

class InitialTableViewController: UITableViewController {
    let defaults = UserDefaults.standard
    var students: [String] = [] // placeholder, will be set by userdefaults

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // clear the userdefaults
//        defaults.set([String](), forKey: "students")
        
        // load the data from UserDefaults
        if let studentData = defaults.array(forKey: "students") as? [String] {
            // successfully found the saved data!
            students = studentData
        } else {
            // No student data saved (first time only, probably!
            defaults.set([String](), forKey: "students")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCellIdentifier", for: indexPath)

        // Configure the cell...
        
        // Downcasting
        if let cellWithOtherName = cell as? InitialTableViewCell {
            cellWithOtherName.studentNameLabel.text = students[indexPath.row]
            
            cellWithOtherName.deleteButton.addTarget(self, action: #selector(deleteButtonPressed(_:)), for: .touchUpInside)
            cellWithOtherName.deleteButton.tag = indexPath.row
            return cellWithOtherName
        }
        
        return cell
    }
    
    @objc func deleteButtonPressed(_ sender: UIButton) {
        print("trying to delete button at row number \(sender.tag)")
        
        // Delete entry number `sender.tag` from the array!
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    @IBAction func addNewPressed(_ sender: Any) {
        let newEntry = Int.random(in: 100...200)
        students.append("Student #\(newEntry)")
        
        // reload the table (if you aren't going to a new screen to add something!
        tableView.reloadData()
        
        // Save the new UserDefaults
        defaults.set(students, forKey: "students")
    }
}
