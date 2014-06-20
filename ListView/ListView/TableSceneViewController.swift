//
//  ViewController.swift
//  ListView
//
//  Created by Ken Ko on 6/16/14.
//  Copyright (c) 2014 Ken Ko. All rights reserved.
//

import UIKit

@objc(TableSceneViewController)
class TableSceneViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    @IBOutlet var buttonAdd: UIButton
    @IBOutlet var tableView: UITableView
    @IBOutlet var tableCell: UITableViewCell
    
    var items: String[] = ["a"]
    var selectedName: String = ""
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "tableCell")
        
        if indexPath.row >= items.count {
            cell.text = "blank!"
        } else {
            cell.text = items[indexPath.row]
        }
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    
    // MARK: Segue
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        selectedName = items[indexPath.row]
        self.performSegueWithIdentifier("TableCellSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        switch(segue.identifier!) {
        case "TableCellSegue":
            NSLog(segue.identifier)
            
            let dst: UINavigationController = segue.destinationViewController as UINavigationController
            let dstvc: TableCellDetailSceneViewController = dst.viewControllers[0] as TableCellDetailSceneViewController
            
            dstvc.labelNameValue = selectedName
            
            break
        case "AddItemSegue":
            NSLog(segue.identifier)
            break
        default:
            NSLog("default")
            break
        }
        
    }
    
    // MARK: IBActions
    
    @IBAction func unwindToRootVC(segue: UIStoryboardSegue) {
        if (segue.sourceViewController.isKindOfClass(AddItemSceneViewController)) {
            let sourceViewController: AddItemSceneViewController = segue.sourceViewController as AddItemSceneViewController
            
            // get data from source...
            let name = sourceViewController.textName.text
            
            NSLog("add: \(name)")
            items.append(name)
            
            // is this efficient?
            tableView.reloadData()
        }
        
        if (segue.sourceViewController.isKindOfClass(TableCellDetailSceneViewController)) {
            let sourceViewController: TableCellDetailSceneViewController = segue.sourceViewController as TableCellDetailSceneViewController
            
            
        }
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

