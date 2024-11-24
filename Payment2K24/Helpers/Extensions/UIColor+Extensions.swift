//
//  UIColor+Extensions.swift
//  Payment2K24
//
//  Created by Aung Kyaw Phyo on 21/11/2024.
//

import Foundation
import UIKit

extension UIColor {
    
    static func appColor(_ name: AssetColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
    
}
