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
    
    @IBOutlet weak var tipsTypeItem: UIBarButtonItem!

    var tipsRate = 0.0
    var billAmount = 0.0
    
    var rateDefault:NSUserDefaults!
    
    var tipsType:Int!
    var tipsTypeDic:NSDictionary!
    var tipsTypeDics:NSDictionary = [
        0 : ["name": "Restaurant", "rate": 10, "icon": "restaurant"],
        1 : ["name": "Taxi", "rate": 15, "icon": "delivery"],
        2 : ["name": "Hotel", "rate": 10, "icon": "hotel"],
        3 : ["name": "Beauty Salon", "rate": 15, "icon": "housekeeping"],
    ];
    
    var isFromSettings:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Read the plist
        let path = NSBundle.mainBundle().pathForResource("TipsTypeAndCurrency", ofType: "plist")
        if let dict = NSMutableDictionary(contentsOfFile: path!) {
            tipsType = dict.objectForKey("TipsType")?.integerValue

            tipsTypeDic = tipsTypeDics.objectForKey(tipsType) as! NSDictionary
        }
        // Read the reference
        rateDefault = NSUserDefaults()
        isFromSettings = rateDefault.boolForKey("FromSettings")
        if(isFromSettings == true)
        {
            tipsRate = tipsTypeDic.objectForKey("rate") as! Double
            isFromSettings = false
        } else {
            tipsRate = rateDefault.doubleForKey("tipsRate")
        }
        billAmount = rateDefault.doubleForKey("billAmount")
        updateUI()
        updateAmount()
        //
        //tipsTypeItem.setBackButtonBackgroundImage(UIImageHelper.getImageFromName("restaurant"), forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        //create a new button
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateBillAmount(sender: AnyObject) {
        if(txtBillAmount.text != "")
        {
            billAmount = (txtBillAmount.text! as NSString).doubleValue
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
        //
        let formatter = NSNumberFormatter()
        formatter.locale = NSLocale.currentLocale()
        //
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        let formatString = "%@"
        lblTipsAmount.text = String(format:formatString, formatter.stringFromNumber(billAmount * tipsRate / 100)!)
        lblTotalAmount.text = String(format:formatString, formatter.stringFromNumber(billAmount * tipsRate / 100 + billAmount)!)
    }
    
    func updateUI(){
        txtBillAmount.text = String(format: "%.f", billAmount)
        sldTipsRate.value = Float(tipsRate)
        lblTipsRate.text = String(format: "%.f%%", tipsRate)
        if(tipsRate < 20){
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.imgEmotion.alpha = 0
                self.imgEmotion.image = UIImage(named:"Smiley-0.jpg")
                self.imgEmotion.alpha = 1
            })
        } else if(tipsRate < 40){
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.imgEmotion.alpha = 0
                self.imgEmotion.image = UIImage(named:"Smiley-020.jpg")
                self.imgEmotion.alpha = 1
            })
        } else if(tipsRate < 60){
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.imgEmotion.alpha = 0
                self.imgEmotion.image = UIImage(named:"Smiley-040.jpg")
                self.imgEmotion.alpha = 1
            })
        } else if(tipsRate < 80){
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.imgEmotion.alpha = 0
                self.imgEmotion.image = UIImage(named:"Smiley-060.png")
                self.imgEmotion.alpha = 1
            })
        } else if(tipsRate < 100){
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.imgEmotion.alpha = 0
                self.imgEmotion.image = UIImage(named:"Smiley-080.jpg")
                self.imgEmotion.alpha = 1
            })
        } else if(tipsRate == 100){
            UIView.animateWithDuration(0.4, animations: {
                // This causes first view to fade in and second view to fade out
                self.imgEmotion.alpha = 0
                self.imgEmotion.image = UIImage(named:"Smiley-100.jpeg")
                self.imgEmotion.alpha = 1
            })
        }
        //let image = UIImageHelper.resizeImage(UIImage.init(named: "restaurant")!, newWidth: 30, newHeight: 30)
        //tipsTypeItem.setBackgroundImage(image, forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
    }
    
}

