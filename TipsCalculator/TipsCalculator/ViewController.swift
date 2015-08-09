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
    
    var tipsType:NSString!
    
    var rateDefault:NSUserDefaults!
    
    var myDictOfDict:NSDictionary = [
        "restaurant" : ["name": "Restaurant", "rate": 10, "icon": "icon-restaurant.png"],
        "taxi" : ["name": "Taxi", "rate": 15, "icon": "icon-taxi.png"],
        "salon" : ["name": "Beauty Salon", "rate": 15, "icon": "icon-salon.png"],
        "hotel" : ["name": "Hotel", "rate": 10, "icon": "icon-hotel.png"],
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Read the reference 
        rateDefault = NSUserDefaults()
        tipsRate = rateDefault.doubleForKey("tipsRate")
        billAmount = rateDefault.doubleForKey("billAmount")
        updateUI()
        updateAmount()
        // Read the saved bundle
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateBillAmount(sender: AnyObject) {
        if(txtBillAmount.text != "")
        {
            billAmount = (txtBillAmount.text as NSString).doubleValue
        } else{
            billAmount = 0.0
        }
        updateAmount()
    }

    @IBAction func updateTipsRate(sender: AnyObject) {
        tipsRate = Double(sldTipsRate.value)
        lblTipsRate.text = String(format: "%.f%%", tipsRate)
        updateAmount()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        rateDefault.setDouble(tipsRate, forKey: "tipsRate")
        rateDefault.setDouble(billAmount, forKey: "billAmount")
        rateDefault.synchronize()
    }
    
    func updateAmount(){
        lblTipsAmount.text = String(format:"%.f", billAmount * tipsRate / 100)
        lblTotalAmount.text = String(format:"%.f", billAmount * tipsRate / 100 + billAmount)
    }
    
    func updateUI(){
        txtBillAmount.text = String(format: "%.f", billAmount)
        sldTipsRate.value = Float(tipsRate)
        lblTipsRate.text = String(format: "%.f%%", tipsRate)
    }
    
}

