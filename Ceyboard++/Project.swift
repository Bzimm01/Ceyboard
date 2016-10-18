//
//  Project.swift
//  Ceyboard++
//
//  Created by Brennan Zimmer on 10/8/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//

import UIKit


class Project {
    // MARK: Properties
    var name: String
    var files: [File]
    var dateLM: NSDate
    
    // MARK: Initilization
    init?(name: String){
        self.name = name
        self.files = [File]()
        
        if (name.isEmpty){
            return nil
        }
        self.dateLM = NSDate()
    }
}
