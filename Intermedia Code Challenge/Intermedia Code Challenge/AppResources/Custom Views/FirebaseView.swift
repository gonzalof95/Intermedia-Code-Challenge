//
//  FirebaseView.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import UIKit
import PureLayout

class FirebaseView: UIView {

    let containerView = UIView(forAutoLayout: ())
    let mailTextField =  CustomTextField(forAutoLayout: ())
    let passwordTextField = CustomTextField(forAutoLayout: ())
    let imageView = UIImageView(forAutoLayout: ())

    required init() {
        super.init(frame: .zero)
        self.backgroundColor = .customLoginBackgroundColor

        containerView.addSubview(mailTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(imageView)
        addSubview(containerView)

        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        addGestureRecognizer(tap)
        setupView()
        setupContraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func dismissKeyboard() {
        endEditing(true)
    }

    private func setupView() {
        containerView.autoPinEdgesToSuperviewEdges()
        containerView.autoMatch(.width, to: .width, of: self)

        if let image = UIImage(named: "Firebase") {
            imageView.image = image
            imageView.frame.size = imageView.setSize(image, containerView)
        }

        mailTextField.placeholder = "Mail"
        mailTextField.keyboardType = .emailAddress

        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
    }

    private func setupContraints() {
        imageView.autoCenterInSuperview()

        passwordTextField.autoAlignAxis(.vertical, toSameAxisOf: containerView)
        passwordTextField.autoSetDimension(.height, toSize: 36)
        passwordTextField.autoPinEdge(.bottom, to: .bottom, of: containerView, withOffset: -24)
        passwordTextField.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 32)
        passwordTextField.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -32)

        mailTextField.autoAlignAxis(.vertical, toSameAxisOf: containerView)
        mailTextField.autoSetDimension(.height, toSize: 36)
        mailTextField.autoPinEdge(.bottom, to: .top, of: passwordTextField, withOffset: -14)
        mailTextField.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 32)
        mailTextField.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -32)
    }
}
