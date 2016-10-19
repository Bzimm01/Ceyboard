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
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        if (selectedProject?.files.isEmpty)!{
            return 1
        }else{
            return (selectedProject?.files.count)!
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "FileTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FileTableViewCell
        
        if (selectedProject?.files.isEmpty)!{
            cell.fileNameLabel.text = "No files yet"
            cell.isUserInteractionEnabled = false
        }else{
            let file = selectedProject?.files[indexPath.row]
            cell.fileNameLabel.text = file?.name
            cell.isUserInteractionEnabled = true
        }

        // Configure the cell...

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
            //let newIndexPath = IndexPath(row: (selectedProject?.files.count)!, section: 0)
            selectedProject?.files.append(newFile!)
            //tableView.insertRows(at: [newIndexPath], with: .bottom)
            
            tableView.reloadData()
            
        }
    }
    
}
