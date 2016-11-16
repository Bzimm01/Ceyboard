//
//  Project.swift
//  Ceyboard++
//
//  Created by Brennan Zimmer on 10/8/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//

import UIKit


class Project: NSObject, NSCoding {
    // MARK: Properties
    var name: String
    var files: [File]
    var dateLM: NSDate
    
    struct PropertyKey{
        static let name = "name"
        static let files = "files"
        static let date = "date"
    }
    
    // MARK: Archive Path
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("projects")
    
    // MARK: Initilization
    init?(name: String, files: [File], date: NSDate){
        self.name = name
        self.files = files
        self.dateLM = date
        
        super.init()
        
        if (name.isEmpty){
            return nil
        }
    }
    
    // MARK: NSCoder
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(files, forKey: PropertyKey.files)
        aCoder.encode(dateLM, forKey: PropertyKey.date)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        let files = aDecoder.decodeObject(forKey: PropertyKey.files) as! [File]
        let date = aDecoder.decodeObject(forKey: PropertyKey.date) as! NSDate
        
        self.init(name: name, files: files, date: date)
    }
}
