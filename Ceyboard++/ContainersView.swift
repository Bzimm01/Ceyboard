//
//  ViewController.swift
//
//
//  Created by Jonathan Berne on 10/18/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit
import Foundation


//Text to pass throughx

class ContainersView: UIViewController {
    @IBOutlet weak var textViewContainer: UITextView!
    var initial_viewText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //textView.text = textViewText
        self.navigationItem.hidesBackButton = true
    
        textViewContainer.text = initial_viewText
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func delete_button(_ sender: AnyObject) {
        textViewContainer.text = initial_viewText! + ""
        //textViewText = textView.text
    }
    @IBAction func deque_button(_ sender: AnyObject) {
        textViewContainer.text = initial_viewText! + "deque"
        //textViewText = textView.text
    }
    @IBAction func stack_button(_ sender: AnyObject) {
        textViewContainer.text = initial_viewText! + "stack"
        //textViewText = textView.text
    }
    @IBAction func vector_button(_ sender: AnyObject) {
        textViewContainer.text = initial_viewText! + "vector"
        //textViewText = textView.text
    }
    
    @IBAction func queue_button(_ sender: AnyObject) {
        textViewContainer.text = initial_viewText! + "queue"
        //textViewText = textView.text
    }
    
    @IBAction func list_button(_ sender: AnyObject) {
        textViewContainer.text = initial_viewText! + "list"
        //textViewText = textView.text
    }
    @IBAction func dataType_button(_ sender: AnyObject) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let nextVC = segue.destination as! DataTypesView
        nextVC.initial_viewText = (textViewContainer.text)!
    }
}
