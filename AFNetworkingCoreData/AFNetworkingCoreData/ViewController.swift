//
//  ViewController.swift
//  AFNetworkingCoreData
//
//  Created by Ken Ko on 6/22/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView
    @IBOutlet var searchText: UITextField
    @IBOutlet var searchButton: UIButton
    
    var results: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "tableCell")
        
        if indexPath.row >= results.count {
            cell.text = "o no!"
        } else {
            cell.textLabel.text = results[indexPath.row].valueForKey("trackName") as String
            cell.detailTextLabel.text = results[indexPath.row].valueForKey("collectionName") as String
        }
        
        return cell
    }
    
    // MARK: IBActions
    
    @IBAction func onClickSearch() {
        if ( !searchText.text.isEmpty) {
            doSearch(searchText.text)
        } else {
            NSLog("empty query, yo")
        }
        
        self.view.endEditing(true)
    }
    
    
    
    // MARK: Convenience
    
    func doSearch(query: String) {
        let manager = AFHTTPRequestOperationManager()
        let url: String = "https://itunes.apple.com/search?term=\(query)"
        
        manager.GET(
            url,
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                self.updateUISuccess(responseObject as NSDictionary!)
            },
            failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
                NSLog("Error=\(error.localizedDescription)")
        })
    }
    
    func updateUISuccess(json: NSDictionary) {
        
        let resultCount: Int = json["resultCount"]? as Int
        results = json["results"]? as NSArray
        
        NSLog("hi... \(results[0])")
        
        if (resultCount > 0) {
            for (k,v: AnyObject) in enumerate(results) {
                var collectionName: String = results[k].valueForKey("collectionName") as String
                var trackName: String = results[k].valueForKey("trackName") as String
                NSLog("collection name=\(collectionName),\(trackName)")
            }
        }
        
        tableView.reloadData()
    }
    
}

