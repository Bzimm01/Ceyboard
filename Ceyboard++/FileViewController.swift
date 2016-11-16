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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        textViewHome.endEditing(true)
        file?.content.text = textViewHome.text!
        TableViewController_OpenExisting.saveProjects()
        print(textViewHome.text!)
        
    }
    
    // MARK: - Navigation

//    @IBAction func backButtonPressed(_ sender: AnyObject) {
//        let fileListTableViewController: TableViewController_FileList = self.storyboard?.instantiateViewController(withIdentifier: "ViewController_FileList") as! TableViewController_FileList
//        self.navigationController?.pushViewController(fileListTableViewController, animated: true)
//    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("going back")
        
    }
    

}
