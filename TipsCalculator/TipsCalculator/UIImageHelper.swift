//
//  UIImageHelper.swift
//  TipsCalculator
//
//  Created by admin on 04/06/16.
//  Copyright © 2016 hoang. All rights reserved.
//

import UIKit

class UIImageHelper {
    class func  getImageFromName(imageName: String) -> UIImage {
        return UIImage.init(named: imageName)!
    }
    class func resizeImage(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage {
        
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}