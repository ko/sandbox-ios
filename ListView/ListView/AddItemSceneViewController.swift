//
//  AddItemSceneViewController.swift
//  ListView
//
//  Created by Ken Ko on 6/16/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

import UIKit

class AddItemSceneViewController: UIViewController {
    
    @IBOutlet var textName: UITextField
    
    var textNameValue: String = ""
    
    // MARK: Application Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
