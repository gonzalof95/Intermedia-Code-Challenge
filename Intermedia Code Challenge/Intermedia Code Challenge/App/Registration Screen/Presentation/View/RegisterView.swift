//
//  RegisterView.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import UIKit
import PureLayout

class RegisterView: UIView {

    let containerView = UIView(forAutoLayout: ())
    let registerButton = CustomButton(forAutoLayout: ())
    var firebaseView: FirebaseView?
    weak var delegate: RegisterViewProtocol?

    required init() {
        super.init(frame: .zero)
        self.backgroundColor = .customLoginBackgroundColor

        self.firebaseView = FirebaseView()
        guard let strongFirebaseView  = firebaseView else { return }

        containerView.addSubview(registerButton)
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

        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        registerButton.activate()
        registerButton.setColor(color: .customSecondButtonColor)
    }

    private func setupContraints() {
        registerButton.autoAlignAxis(.vertical, toSameAxisOf: containerView)
        registerButton.autoSetDimension(.height, toSize: 44)
        registerButton.autoPinEdge(.bottom, to: .bottom, of: containerView, withOffset: -74)
        registerButton.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 24)
        registerButton.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -24)

        firebaseView?.autoAlignAxis(.vertical, toSameAxisOf: containerView)
        firebaseView?.autoPinEdge(.leading, to: .leading, of: containerView)
        firebaseView?.autoPinEdge(.trailing, to: .trailing, of: containerView)
        firebaseView?.autoPinEdge(.top, to: .top, of: containerView)
        firebaseView?.autoPinEdge(.bottom, to: .top, of: registerButton)
    }

    @objc private func registerButtonTapped() {
        delegate?.registerButtonTapped()
    }
}
