//
//  NewFileViewController.swift
//  Ceyboard++
//
//  Created by Brennan Zimmer on 10/15/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//
import Foundation
import UIKit

class NewFileViewController: UIViewController, UINavigationControllerDelegate{
    
    var file : File?
    var selectedProject: Project?
    
    @IBAction func cancel(_ sender: AnyObject) {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var newFileName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func prepareForSegue(_ sender: AnyObject) {
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (newFileName.text?.isEmpty)!{
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = newFileName.text!
        file = File(name: name, content: UITextView())
    }
}
