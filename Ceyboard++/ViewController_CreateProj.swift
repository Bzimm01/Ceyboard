//
//  ViewController_CreateProj.swift
//  Ceyboard++
//
//  Created by Zach Finkbeiner on 10/7/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//

import Foundation

import UIKit

class ViewController_CreateProj: UIViewController {
    
    @IBOutlet weak var ProjectNameText: UITextField!
    
    @IBAction func CreateProjPressed(_ sender: AnyObject) {
        if (ProjectNameText.text?.isEmpty)! {
            return
        }
        let fileListTableViewController: TableViewController_FileList = self.storyboard?.instantiateViewController(withIdentifier: "ViewController_FileList") as! TableViewController_FileList
        fileListTableViewController.selectedProject = Project(name: ProjectNameText.text!)
        self.navigationController?.pushViewController(fileListTableViewController, animated: true)
    }
    

}
