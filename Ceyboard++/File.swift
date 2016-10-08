//
//  File.swift
//  Ceyboard++
//
//  Created by Brennan Zimmer on 10/8/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//

import UIKit

class File{
    // MARK: Properties
    var name: String
    var content: UITextField
    
    // MARK: Initilization
    init?(name: String){
        
        self.name = name
        self.content = UITextField()
        
        if (name.isEmpty){
            return nil
        }
        
    }
}
