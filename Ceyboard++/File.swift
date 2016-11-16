//
//  File.swift
//  Ceyboard++
//
//  Created by Brennan Zimmer on 10/8/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//

import UIKit

class File: NSObject, NSCoding{
    // MARK: Properties
    var name: String
    var content: UITextView
    
    struct PropertyKey{
        static let name = "name"
        static let content = "content"
    }
    
    // MARK: Initilization
    init?(name: String, content: UITextView){
        
        self.name = name
        self.content = content
        
        if (name.isEmpty){
            return nil
        }
        
    }
    
    // MARK: NSCoder
    func encode(with aCoder: NSCoder){
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(content, forKey: PropertyKey.content)
    }
    required convenience init?(coder aDecoder: NSCoder){
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        let content = aDecoder.decodeObject(forKey: PropertyKey.content) as! UITextView
        self.init(name: name, content: content)
    }
}
