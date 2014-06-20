//
//  TableCellSceneViewController.swift
//  ListView
//
//  Created by Ken Ko on 6/18/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

import UIKit

class TableCellDetailSceneViewController: UIViewController {
    
    
    @IBOutlet var labelName: UILabel
    
    var labelNameValue: String = ""
    
    
    // MARK: Application Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.labelName.text = self.labelNameValue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
