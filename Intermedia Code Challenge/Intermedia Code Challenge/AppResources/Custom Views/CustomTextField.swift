//
//  CustomTextField.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 10/12/2020.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLabel() {
        setStyle()
        setShadow()
    }

    private func setStyle() {
        layer.cornerRadius = 4
        backgroundColor = .white
        isUserInteractionEnabled = true
    }

    private func setShadow() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        clipsToBounds = true
    }
}
