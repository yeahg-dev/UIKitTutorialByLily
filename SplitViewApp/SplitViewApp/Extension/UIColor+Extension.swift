//
//  UIColor+Extension.swift
//  SplitViewApp
//
//  Created by 1 on 2022/02/13.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
           self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
       }
}
