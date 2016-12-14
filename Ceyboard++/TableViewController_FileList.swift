//
//  TableViewController_FileList.swift
//  Ceyboard++
//
//  Created by Brennan Zimmer on 10/11/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//
import Foundation
import UIKit

class TableViewController_FileList: UITableViewController {
    // MARK: Properties
    var selectedProject: Project?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = selectedProject?.name
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: Actions
    
    @IBAction func addButtonPressed(_ sender: AnyObject) {
        let newFileViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateNewFileVC") as! NewFileViewController
        newFileViewController.selectedProject = self.selectedProject
        self.navigationController?.pushViewController(newFileViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (selectedProject?.files.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "FileTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FileTableViewCell
        
        let file = selectedProject?.files[indexPath.row]
        cell.fileNameLabel.text = file?.name
        cell.isUserInteractionEnabled = true

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let yesActionHandler = { (action:UIAlertAction!) -> Void in
                self.selectedProject?.files.remove(at: indexPath.row)
                TableViewController_OpenExisting.saveProjects()
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let alertView = UIAlertController(title: "Are you sure?", message: "You will not be able to recover this file once it is deleted.  Are you sure you want to continue?", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Yes", style: .default, handler: yesActionHandler)
            alertView.addAction(defaultAction)
            let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
            alertView.addAction(cancelAction)
            present(alertView, animated: true, completion: nil)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowFileDetail" {
            if (selectedProject?.files.isEmpty)!{
                return
            }
            print(segue.destination)
            let fileDetailViewController = segue.destination as! FileViewController
            if let selectedFileCell = sender as? FileTableViewCell{
                let indexPath = tableView.indexPath(for: selectedFileCell)
                let selectedFile = selectedProject?.files[(indexPath?.row)!]
                fileDetailViewController.file = selectedFile
            }
        }
    }
 
    
    @IBAction func unwindToFileList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? NewFileViewController{
            let newFile = sourceViewController.file
            selectedProject?.files.append(newFile!)
            
            tableView.reloadData()
            TableViewController_OpenExisting.saveProjects()
        }
    }
    
}
