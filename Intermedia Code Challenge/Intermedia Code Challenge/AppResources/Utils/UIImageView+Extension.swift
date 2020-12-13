//
//  UIImageView+Extension.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 10/12/2020.
//

import UIKit

extension UIImageView {
    func setSize(_ image: UIImage,_ containerView: UIView) -> CGSize {
        let ratio = image.size.width / image.size.height
            if containerView.frame.width > containerView.frame.height {
                let newHeight = containerView.frame.width / ratio
                return CGSize(width: containerView.frame.width, height: newHeight)
            }
            else{
                let newWidth = containerView.frame.height * ratio
                return CGSize(width: newWidth, height: containerView.frame.height)
            }
    }
}
