//
//  PlistHelper.swift
//  TipsCalculator
//
//  Created by admin on 04/06/16.
//  Copyright © 2016 hoang. All rights reserved.
//

import Foundation

class PlistHelper {
    class func readFromFile(fileName: String) -> NSMutableDictionary {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "plist")
        return NSMutableDictionary(contentsOfFile: path!)!
    }
}