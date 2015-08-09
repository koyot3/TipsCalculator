//
//  ViewController.swift
//  TipsCalculator
//
//  Created by admin on 8/8/15.
//  Copyright (c) 2015 hoang. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController, UITableViewDelegate {
    
    var currency:NSString!
    var tipsType:NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(red: 243.0/255, green: 243.0/255, blue: 243.0/255, alpha: 1)
        var path = NSBundle.mainBundle().pathForResource("TipsTypeAndCurrency", ofType: "plist")
        if var dict = NSMutableDictionary(contentsOfFile: path!) {
            currency = dict.objectForKey("Currency") as NSString
            tipsType = dict.objectForKey("TipsType") as NSString
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as UITableViewHeaderFooterView
        headerView.textLabel.textColor = UIColor(red: 151.0/255, green: 193.0/255, blue: 100.0/255, alpha: 1)
        let font = UIFont(name: "Montserrat", size: 18.0)
        headerView.textLabel.font = font!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Write to plist
        var path = NSBundle.mainBundle().pathForResource("TipsTypeAndCurrency", ofType: "plist")
        if var dict = NSMutableDictionary(contentsOfFile: path!) {
            dict.setValue(currency, forKey: "Currency")
            dict.setValue(tipsType, forKey: "TipsType")
            dict.writeToFile(path!, atomically: false)
        }
    }
    
    override func tableView(_tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath){
            NSIndexPath selectedRow = indexPath
            //for(NSIndex _tableView.indexPathsForVisibleRows()

    }
    
}
