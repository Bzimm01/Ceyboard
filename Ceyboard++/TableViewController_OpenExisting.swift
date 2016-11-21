//
//  TableViewController_OpenExisting.swift
//  Ceyboard++
//
//  Created by Brent Boudreau on 10/11/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//

import UIKit

class TableViewController_OpenExisting: UITableViewController {
    
    static
    
    
    var allProjects: [Project] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let Project1 = Project(name : "Project 1", files: [File](), date: NSDate()); TableViewController_OpenExisting.allProjects.append(Project1!)
        Project1?.files.append(File(name: "sampleFile.cpp")!)
        let Project2 = Project(name : "Project 2", files: [File](), date: NSDate()); TableViewController_OpenExisting.allProjects.append(Project2!)
        let Project3 = Project(name : "Project 3", files: [File](), date: NSDate()); TableViewController_OpenExisting.allProjects.append(Project3!)
        let Project4 = Project(name : "Project 4", files: [File](), date: NSDate()); TableViewController_OpenExisting.allProjects.append(Project4!)
        let Project5 = Project(name : "Project 5", files: [File](), date: NSDate()); TableViewController_OpenExisting.allProjects.append(Project5!)
        let Project11 = Project(name : "Project 11", files: [File](), date: NSDate()); TableViewController_OpenExisting.allProjects.append(Project11!)
        let Project21 = Project(name : "Project 21", files: [File](), date: NSDate()); TableViewController_OpenExisting.allProjects.append(Project21!)
        let Project31 = Project(name : "Project 31", files: [File](), date: NSDate()); TableViewController_OpenExisting.allProjects.append(Project31!)
        let Project41 = Project(name : "Project 41", files: [File](), date: NSDate()); TableViewController_OpenExisting.allProjects.append(Project41!)
        let Project51 = Project(name : "Project 51", files: [File](), date: NSDate()); TableViewController_OpenExisting.allProjects.append(Project51!)
        */
        
        TableViewController_OpenExisting.allProjects = loadProjects()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        // #warning Incomplete implementation, return the number of rows
        
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
            TableViewController_OpenExisting.allProjects.remove(at: indexPath.row)
            TableViewController_OpenExisting.saveProjects()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        } else if editingStyle == .insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
     }
    
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedProject = TableViewController_OpenExisting.allProjects[indexPath.row]
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ViewController_FileList") as! TableViewController_FileList
        viewController.selectedProject = selectedProject
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }*/
    
    // MARK: NSCoding
    static func saveProjects(){
        let isSaveSuccessful = NSKeyedArchiver.archiveRootObject(allProjects, toFile: Project.ArchiveURL.path)
        if (!isSaveSuccessful){
            print("Save did not work")
        }
    }
    
    func loadProjects() -> [Project]{
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
