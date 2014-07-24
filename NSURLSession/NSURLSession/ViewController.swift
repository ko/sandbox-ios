//
//  ViewController.swift
//  NSURLSession
//
//  Created by Ken Ko on 6/22/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var nsurl: NSURL = NSURL.URLWithString("https://itunes.apple.com/search?term=apple&media=software")
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        doItunesGet()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: Convenience
    
    func doItunesGet() {
        
        var session: NSURLSession = NSURLSession.sharedSession()
        
        
        var dataTask: NSURLSessionDataTask = session.dataTaskWithURL(nsurl, completionHandler: {(data, response, error) in
            let json: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
            NSLog(json.description)
            
            })
        
        dataTask.resume()
    }
}

