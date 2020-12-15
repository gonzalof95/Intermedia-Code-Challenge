//
//  UIKit+Extension.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 10/12/2020.
//

import UIKit

extension UIColor {
    static let customColorMain = UIColor(red: 38.0/255.0, green: 38.0/255.0, blue: 38.0/255.0, alpha: 1.0)
    static let customBackgroundColor = UIColor(red: 236.0/255.0, green: 239.0/255.0, blue: 241.0/255.0, alpha: 1.0)
    static let customMainButtonColor = UIColor(red: 255.0/255.0, green: 138.0/255.0, blue: 101.0/255.0, alpha: 1.0)
    static let customSecondButtonColor = UIColor(red: 3.0/255.0, green: 155.0/255.0, blue: 229.0/255.0, alpha: 1.0)
    static let customLoginBackgroundColor = UIColor(red: 44.0/255.0, green: 56.0/255.0, blue: 74.0/255.0, alpha: 1.0)
    static let customWhiteColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    static let customBlackColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    static let customShadowColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.2)
}

extension UIView {
    func setViewShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
