//
//  ViewController.swift
//  RESTClient
//
//  Created by Ken Ko on 6/21/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var labelResult: UILabel
    @IBOutlet var buttonSend: UIButton
    
    var url: String = "http://api.openweathermap.org/data/2.5/weather?q=London,uk"
    
    var session: NSURLSession = NSURLSession.sharedSession()
    
    
    // MARK: IBActions
    
    @IBAction func onClickButtonSend() {
        NSLog("click")
        
        var result: String = "empty!"
        
        session.dataTaskWithHTTPGetRequest(NSURL.URLWithString(url))
        
        
        labelResult.text = result
    }
    
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

