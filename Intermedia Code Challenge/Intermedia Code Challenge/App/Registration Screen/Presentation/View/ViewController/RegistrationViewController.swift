//
//  RegistrationViewController.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import UIKit
import PureLayout
import FirebaseAuth

class RegistrationViewController: BaseViewController {
    var customView: RegisterView?
    var presenter: RegistrationPresenter?

    init(with presenter: RegistrationPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.delegate = self
    }

    required convenience init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    private func setView() {
        self.customView = RegisterView()
        guard let strongCustomView = customView else { return }
        strongCustomView.delegate = self

        view.addSubview(strongCustomView)
        customView?.autoPinEdgesToSuperviewEdges()
    }
}

extension RegistrationViewController: RegisterViewProtocol {
    func registerButtonTapped() {
        if let email = customView?.firebaseView?.mailTextField.text,
           let password = customView?.firebaseView?.passwordTextField.text {
            presenter?.registerButtonTapped(email: email, password: password)
        }
    }
}
