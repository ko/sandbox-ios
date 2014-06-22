//
//  ViewController.swift
//  CoreData
//
//  Created by Ken Ko on 6/19/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textfield: UITextField
    @IBOutlet var label: UILabel
    @IBOutlet var button: UIButton
    
    
    // MARK: IBAction
    
    @IBAction func onclicksave() {
        
        var persons: NSArray = personMgr.getPerson()
        var newname: String
        
        if (textfield.text.isEmpty) {
            newname = "empty!"
        } else {
            newname = textfield.text
        }
        NSLog("want to add: \(newname)")
        
        if (persons.count  == 0) {
            personMgr.addPerson(newname)
        } else {
            
            NSLog("personMgr arr count = \(personMgr.getPerson().count)")
            
            var person: AnyObject! = personMgr.getFirstPerson()
            
            if (person != nil) {
                NSLog("person != nil")
                
                personMgr.newName(person, name: newname)
                
                label.text = person.valueForKey("name") as String
                
            } else {
                NSLog("person == nil")
            }
        }
    }
    
    // MARK: Application Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadFromCoreData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: Convenience
    
    func loadFromCoreData() {
        let persons: NSArray = personMgr.getPerson() as NSArray
        
        if (persons.count != 0) {
            label.text = persons.firstObject.name
        }
    }
}

