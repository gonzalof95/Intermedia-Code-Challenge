//
//  LoginView.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 10/12/2020.
//

import UIKit
import PureLayout

protocol LoginViewProtocol: AnyObject {
    func accessButtonTapped()
    func registerButtonTapped()
}

class LoginView: UIView {

    let containerView = UIView(forAutoLayout: ())
    let registerButton = CustomButton(forAutoLayout: ())
    let accessButton = CustomButton(forAutoLayout: ())
    var firebaseView: FirebaseView?
    weak var delegate: LoginViewProtocol?

    required init() {
        super.init(frame: .zero)
        self.backgroundColor = .customLoginBackgroundColor

        self.firebaseView = FirebaseView()
        guard let strongFirebaseView  = firebaseView else { return }

        containerView.addSubview(registerButton)
        containerView.addSubview(accessButton)
        containerView.addSubview(strongFirebaseView)
        addSubview(containerView)

        setupView()
        setupContraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        containerView.autoPinEdgesToSuperviewEdges()
        containerView.autoMatch(.width, to: .width, of: self)

        accessButton.setTitle("Access", for: .normal)
        accessButton.addTarget(self, action: #selector(accessButtonTapped), for: .touchUpInside)
        accessButton.activate()
        accessButton.setColor(color: .customMainButtonColor)

        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.activate()
        registerButton.setColor(color: .customSecondButtonColor)
    }

    private func setupContraints() {
        registerButton.autoAlignAxis(.vertical, toSameAxisOf: containerView)
        registerButton.autoSetDimension(.height, toSize: 44)
        registerButton.autoPinEdge(.bottom, to: .bottom, of: containerView, withOffset: -24)
        registerButton.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 24)
        registerButton.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -24)

        accessButton.autoAlignAxis(.vertical, toSameAxisOf: containerView)
        accessButton.autoSetDimension(.height, toSize: 44)
        accessButton.autoPinEdge(.bottom, to: .top, of: registerButton, withOffset: -8)
        accessButton.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 24)
        accessButton.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -24)

        firebaseView?.autoAlignAxis(.vertical, toSameAxisOf: containerView)
        firebaseView?.autoPinEdge(.leading, to: .leading, of: containerView)
        firebaseView?.autoPinEdge(.trailing, to: .trailing, of: containerView)
        firebaseView?.autoPinEdge(.top, to: .top, of: containerView)
        firebaseView?.autoPinEdge(.bottom, to: .top, of: accessButton)
    }

    @objc func accessButtonTapped() {
        delegate?.accessButtonTapped()
    }

    @objc func registerButtonTapped() {
        delegate?.registerButtonTapped()
    }
}
