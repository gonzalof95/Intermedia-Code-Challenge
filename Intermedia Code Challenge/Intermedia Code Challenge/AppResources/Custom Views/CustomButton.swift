//
//  CustomButton.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 10/12/2020.
//

import UIKit

protocol CustomButtonProtocol: AnyObject {
    func buttonTapped()
}

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
        setShadow()
    }

    private func setStyle() {
        setTitleColor(.white, for: .normal)

        titleLabel?.font = UIFont(name: Fonts.mainFont, size: 18)
        layer.cornerRadius = 8
        isEnabled = false
        alpha = 0.25
    }

    private func setShadow() {
        layer.shadowColor = UIColor.customShadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        clipsToBounds = true
    }

    func setColor(color: UIColor) {
        backgroundColor = color
    }

    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true

        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        let toPoint = CGPoint(x: center.x + 8, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)

        shake.fromValue = fromValue
        shake.toValue = toValue

        layer.add(shake, forKey: "position")
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
