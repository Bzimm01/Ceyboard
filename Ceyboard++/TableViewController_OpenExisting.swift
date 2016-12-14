//
//  TableViewController_OpenExisting.swift
//  Ceyboard++
//
//  Created by Brent Boudreau on 10/11/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//

import UIKit

class TableViewController_OpenExisting: UITableViewController {
    
    static var allProjects: [Project] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewController_OpenExisting.allProjects = TableViewController_OpenExisting.loadProjects()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    /*
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 1
     }
     */
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TableViewController_OpenExisting.allProjects.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "TableViewCell_OpenExisting"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TableViewCell_OpenExisting
        
        let dateLM = TableViewController_OpenExisting.allProjects[indexPath.row].dateLM
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let strDateLM = dateFormatter.string(from: dateLM as Date)
        
        cell.projectName.text = TableViewController_OpenExisting.allProjects[indexPath.row].name
        cell.dateLM.text = strDateLM
        
        return cell
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let yesActionHandler = { (action:UIAlertAction!) -> Void in
                TableViewController_OpenExisting.allProjects.remove(at: indexPath.row)
                TableViewController_OpenExisting.saveProjects()
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let alertView = UIAlertController(title: "Are you sure?", message: "You will not be able to recover this project once it is deleted.  Are you sure you want to continue?", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Yes", style: .default, handler: yesActionHandler)
            alertView.addAction(defaultAction)
            let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
            alertView.addAction(cancelAction)
            present(alertView, animated: true, completion: nil)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    // MARK: NSCoding
    static func saveProjects(){
        let isSaveSuccessful = NSKeyedArchiver.archiveRootObject(allProjects, toFile: Project.ArchiveURL.path)
        if (!isSaveSuccessful){
            print("Save did not work")
        }
    }
    
    static func loadProjects() -> [Project]{
        return (NSKeyedUnarchiver.unarchiveObject(withFile: Project.ArchiveURL.path) as? [Project])!
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SelectProject" {
            
            let fileListViewController = segue.destination as! TableViewController_FileList
            
            if let selectedProjectCell = sender as? TableViewCell_OpenExisting {
                let indexPath = tableView.indexPath(for: selectedProjectCell)!
                let selectedProject = TableViewController_OpenExisting.allProjects[indexPath.row]
                fileListViewController.selectedProject = selectedProject
                
                print(selectedProject)
                print("was selected!")
            }
        }
    }
    
    
}
