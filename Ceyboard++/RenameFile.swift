//
//  RenameFile.swift
//  Ceyboard++
//
//  Created by Brennan Zimmer on 12/11/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//

import Foundation
import UIKit

class RenameFile: UIViewController, UINavigationControllerDelegate{
    override func viewDidLoad() {
        navigationItem.title = "Rename File"
    }
    
    @IBOutlet weak var newFileName: UITextField!
    
    @IBAction func cancelPress(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (newFileName.text?.isEmpty)!{
            return false
        }
        return true
    }
}
