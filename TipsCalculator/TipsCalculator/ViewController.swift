//
//  ViewController.swift
//  TipsCalculator
//
//  Created by admin on 8/8/15.
//  Copyright (c) 2015 hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtBillAmount: UITextField!
    
    @IBOutlet weak var lblTipsAmount: UILabel!
    @IBOutlet weak var lblTipsRate: UILabel!
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    @IBOutlet weak var sldTipsRate: UISlider!
    

    var tipsRate = 0.0
    var billAmount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Read the reference 
        // Default rate
        
        // Read the saved bundle
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateBillAmount(sender: AnyObject) {
    }

    @IBAction func updateTipsRate(sender: AnyObject) {
    }
    
    
}

