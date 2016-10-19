//
//  datatypes_ViewController.swift
//
//
//  Created by Jonathan Berne on 10/18/16.
//  Copyright © 2016. All rights reserved.
//

import Foundation
import UIKit


class DataTypesView: UIViewController {
    
    @IBOutlet weak var textViewDataType: UITextView!
    
    var initial_viewText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //textView.text = textViewText
        self.navigationItem.hidesBackButton = true
        textViewDataType.text = initial_viewText
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func int_button(_ sender: AnyObject) {
        textViewDataType.text = initial_viewText! + "<int>"
    }
    @IBAction func string_button(_ sender: AnyObject) {
        textViewDataType.text = initial_viewText! + "<string>"
        
    }
    @IBAction func double_button(_ sender: AnyObject) {
        textViewDataType.text = initial_viewText! + "<double>"
        
    }
    @IBAction func bool_button(_ sender: AnyObject) {
        textViewDataType.text = initial_viewText! + "<bool>"
        
    }
    @IBAction func char_button(_ sender: AnyObject) {
        textViewDataType.text = initial_viewText! + "<char>"
        
    }
    @IBAction func other_button(_ sender: AnyObject) {

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let nextVC = segue.destination as! FileViewController
        nextVC.initial_viewText = (textViewDataType.text)!
    }
}
