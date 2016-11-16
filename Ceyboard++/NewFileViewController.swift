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
        
        // Disable Save button if nothing is there
        //checkValidFileName()
    }
    
    @IBAction func prepareForSegue(_ sender: AnyObject) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let name = newFileName.text ?? ""
        file = File(name: name, content: UITextView())
        
    }
    
    // MARK: Navigation
    
    // MARK: Save Button
    
//    func textFieldDidBeginEditing(textField: UITextField) {
//        // Disable the Save button while editing.
//        saveButton.isEnabled = false
//    }
//    
//    func checkValidFileName() {
//        // Disable the Save button if the text field is empty.
//        let text = newFileName.text ?? ""
//        saveButton.isEnabled = !text.isEmpty
//    }
//    
//    func textFieldDidEndEditing(textField: UITextField) {
//        checkValidFileName()
//        navigationItem.title = newFileName.text
//    }
    
    
}
