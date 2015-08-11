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
    @IBOutlet weak var imgEmotion: UIImageView!
    @IBOutlet weak var barTipsTypeIcon: UIBarButtonItem!
    
    @IBOutlet weak var tipsTypeItem: UIBarButtonItem!

    var tipsRate = 0.0
    var billAmount = 0.0
    
    var rateDefault:NSUserDefaults!
    
    var tipsType:Int!
    var tipsTypeDic:NSDictionary!
    var tipsTypeDics:NSDictionary = [
        0 : ["name": "Restaurant", "rate": 10, "icon": "icon-restaurant.png"],
        1 : ["name": "Taxi", "rate": 15, "icon": "icon-taxi.png"],
        2 : ["name": "Beauty Salon", "rate": 15, "icon": "icon-salon.png"],
        3 : ["name": "Hotel", "rate": 10, "icon": "icon-hotel.png"],
    ];
    var currency:Int!
    var currencyDic:NSDictionary!
    var currencyDics:NSDictionary = [
        0 : ["symbol": "đ", "type": 0, "name": "vnd"],
        1 : ["symbol": "$", "type": 1, "name": "usd"],
        2 : ["symbol": "€", "type": 1, "name": "jpy"],
        3 : ["symbol": "¥", "type": 1, "name": "eur"],
    ];
    
    var isFromSettings:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Read the plist
        var path = NSBundle.mainBundle().pathForResource("TipsTypeAndCurrency", ofType: "plist")
        if var dict = NSMutableDictionary(contentsOfFile: path!) {
            currency = dict.objectForKey("Currency")?.integerValue
            tipsType = dict.objectForKey("TipsType")?.integerValue

            tipsTypeDic = tipsTypeDics.objectForKey(tipsType) as NSDictionary
            currencyDic = currencyDics.objectForKey(currency) as NSDictionary
        }
        // Read the reference
        rateDefault = NSUserDefaults()
        isFromSettings = rateDefault.boolForKey("FromSettings")
        if(isFromSettings == true)
        {
            tipsRate = tipsTypeDic.objectForKey("rate") as Double
            isFromSettings = false
        } else {
            tipsRate = rateDefault.doubleForKey("tipsRate")
        }
        billAmount = rateDefault.doubleForKey("billAmount")
        updateUI()
        updateAmount()
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
        tipsRate = Double(round(sldTipsRate.value*1)/1)
        lblTipsRate.text = String(format: "%.f%%", tipsRate)
        txtBillAmount.resignFirstResponder()
        updateAmount()
        // update icon smiley 
        updateUI()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        rateDefault.setDouble(tipsRate, forKey: "tipsRate")
        rateDefault.setDouble(billAmount, forKey: "billAmount")
        rateDefault.setBool(false, forKey: "FromSettings")
        rateDefault.synchronize()
    }
    
    func updateAmount(){
        var currencyIntValue = currencyDic.objectForKey("type") as Int
        var currencySymbolValue = currencyDic.objectForKey("symbol") as NSString
        var formatString = ""
        if(currencyIntValue == 1){
            formatString = "%@%.f"
            lblTipsAmount.text = String(format:formatString, currencySymbolValue ,billAmount * tipsRate / 100)
            lblTotalAmount.text = String(format:formatString, currencySymbolValue, billAmount * tipsRate / 100 + billAmount)
        } else {
            formatString = "%.f%@"
            lblTipsAmount.text = String(format:formatString, billAmount * tipsRate / 100, currencySymbolValue)
            lblTotalAmount.text = String(format:formatString, billAmount * tipsRate / 100 + billAmount, currencySymbolValue)
        }
    }
    
    func updateUI(){
        txtBillAmount.text = String(format: "%.f", billAmount)
        sldTipsRate.value = Float(tipsRate)
        lblTipsRate.text = String(format: "%.f%%", tipsRate)
        if(tipsRate < 20){
            imgEmotion.image = UIImage(named:"Smiley-0.jpg")
        } else if(tipsRate < 40){
            imgEmotion.image = UIImage(named:"Smiley-020.jpg")
        } else if(tipsRate < 60){
            imgEmotion.image = UIImage(named:"Smiley-040.jpg")
        } else if(tipsRate < 80){
            imgEmotion.image = UIImage(named:"Smiley-060.png")
        } else if(tipsRate < 100){
            imgEmotion.image = UIImage(named:"Smiley-080.jpg")
        } else if(tipsRate == 100){
            imgEmotion.image = UIImage(named:"Smiley-100.jpeg")
        }
        // Update tip bar item
        tipsTypeItem.title = tipsTypeDic.objectForKey("name") as NSString
    }
    
}

