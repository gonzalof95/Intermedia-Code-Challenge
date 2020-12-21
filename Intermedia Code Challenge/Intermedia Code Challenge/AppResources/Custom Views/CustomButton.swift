//
//  CustomButton.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 10/12/2020.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setButton() {
        setStyle()
        setViewShadow()
    }

    private func setStyle() {
        setTitleColor(.white, for: .normal)

        titleLabel?.font = UIFont(name: Fonts.robotoCondensed, size: 18)
        layer.cornerRadius = 8
        isEnabled = false
        alpha = 0.25
    }

    func setColor(color: UIColor) {
        backgroundColor = color
    }

    func activate() {
        isEnabled = true
        alpha = 1.0
    }

    func deactivate() {
        isEnabled = false
        alpha = 0.25
    }
}
