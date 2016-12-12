//
//  FileViewController.swift
//  Ceyboard++
//
//  Created by Brennan Zimmer on 10/18/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//

import UIKit

//var textViewText = ""

class FileViewController: UIViewController {
    
    // MARK: Properties
    var file: File?
    @IBOutlet weak var textViewHome: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = file?.name
        self.automaticallyAdjustsScrollViewInsets = false

        textViewHome.text = file?.content.text
    }
    override func viewWillDisappear(_ animated: Bool) {
        file?.content.text = textViewHome.text!
        TableViewController_OpenExisting.saveProjects()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        textViewHome.endEditing(true)
        file?.content.text = textViewHome.text!
        TableViewController_OpenExisting.saveProjects()
        print(textViewHome.text!)
        let alertView = UIAlertController(title: "Success!", message: "File saved", preferredStyle: .alert)
        present(alertView, animated: true, completion: nil)
        let when = DispatchTime.now() + 2 // delay of 2 seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Your code with delay
            alertView.dismiss(animated: true, completion: nil)
        }
        
    }
    
    // MARK: - Navigation
    
    override func willMove(toParentViewController parent: UIViewController?) {
        if parent == nil {
            print("back button press")
            // Back btn Event handler
            textViewHome.endEditing(true)
            file?.content.text = textViewHome.text!
            TableViewController_OpenExisting.saveProjects()
            
        }else{
            
        }
    }

    @IBAction func unwindToFileView(sender: UIStoryboardSegue){
        let renameVC = sender.source as! RenameFile
        file?.name = renameVC.newFileName.text!
        TableViewController_OpenExisting.saveProjects()
        navigationItem.title = file?.name
        
    }
    
}
