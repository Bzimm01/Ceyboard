//
//  ViewController_FileList.swift
//  Ceyboard++
//
//  Created by Brennan Zimmer on 10/8/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//

import Foundation
import UIKit

class ViewController_FileList: UIViewController{
    
    var selectedProject: Project?
    
    @IBOutlet weak var SelectedProjectName: UILabel!
    
    @IBOutlet weak var FileList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SelectedProjectName.text = selectedProject?.name
        
    }
}
