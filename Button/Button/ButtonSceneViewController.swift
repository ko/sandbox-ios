//
//  ButtonViewController.swift
//  Button
//
//  Created by Ken Ko on 6/16/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

import UIKit

class ButtonSceneViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet var button: UIButton
    @IBOutlet var label: UILabel
    
    weak var selectedButton: UIButton?
    
    
    
    // MARK: IBActions
    
    @IBAction func buttonTapped(sender: UIButton) {
        println("button clicked")
        
        if sender.layer.borderWidth == 5.0 {
            label.text = "5"
            sender.layer.borderWidth = 1.0
        } else {
            label.text = "1"
            sender.layer.borderWidth = 5.0
        }
        
        selectedButton = sender
    }
    
    // MARK: asdf
    
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: Convenience
    

    
    
}