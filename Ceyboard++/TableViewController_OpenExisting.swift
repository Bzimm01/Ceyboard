//
//  TableViewController_OpenExisting.swift
//  Ceyboard++
//
//  Created by Brent Boudreau on 10/11/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//

import UIKit

class TableViewController_OpenExisting: UITableViewController {
    
    var allProjects: [Project] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Project1 = Project(name : "Project 1"); allProjects.append(Project1!)
        Project1?.files.append(File(name: "sampleFile.cpp")!)
        let Project2 = Project(name : "Project 2"); allProjects.append(Project2!)
        let Project3 = Project(name : "Project 3"); allProjects.append(Project3!)
        let Project4 = Project(name : "Project 4"); allProjects.append(Project4!)
        let Project5 = Project(name : "Project 5"); allProjects.append(Project5!)
        let Project11 = Project(name : "Project 11"); allProjects.append(Project11!)
        let Project21 = Project(name : "Project 21"); allProjects.append(Project21!)
        let Project31 = Project(name : "Project 31"); allProjects.append(Project31!)
        let Project41 = Project(name : "Project 41"); allProjects.append(Project41!)
        let Project51 = Project(name : "Project 51"); allProjects.append(Project51!)
        
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
        return 0
    }
 */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return allProjects.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed(
            "TableViewCell_OpenExisting", owner: self, options: nil)?.first as! TableViewCell_OpenExisting
        
        let dateLM = allProjects[indexPath.row].dateLM
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let strDateLM = dateFormatter.string(from: dateLM as Date)
        
        cell.projectName.text = allProjects[indexPath.row].name
        cell.dateLM.text = strDateLM
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedProject = allProjects[indexPath.row]
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ViewController_FileList") as! TableViewController_FileList
        viewController.selectedProject = selectedProject
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }

    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "I'am a test label"
        self.view.addSubview(label)
        
        return label
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SelectProject" {
            
            let fileListViewController = segue.destination as! TableViewController_FileList
            
            if let selectedProjectCell = sender as? TableViewCell_OpenExisting {
                let indexPath = tableView.indexPath(for: selectedProjectCell)!
                let selectedProject = allProjects[indexPath.row]
                fileListViewController.selectedProject = selectedProject
                
                print(selectedProject)
                print("was selected!")
            }
        }
    }
 */

}
