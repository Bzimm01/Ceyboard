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
    @IBOutlet weak var textViewHome: UITextView!

    // MARK: Properties
    
    var file: File?
    var initial_viewText: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = file?.name
        if (initial_viewText == nil){
            textViewHome.text = file?.content
        }else{
            textViewHome.text = initial_viewText
        }
        self.navigationItem.hidesBackButton = true //CHANGE
            //textViewText = textView.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let nextVC = segue.destination as! ContainersView
        if (self.textViewHome.text == nil){
            nextVC.textViewContainer.text = ""
        }else{
            print(textViewHome.text)
            nextVC.initial_viewText = (textViewHome.text)!
        }
        
    }
    

}
