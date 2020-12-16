//
//  LoginViewControlller.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import UIKit
import PureLayout

protocol LoginViewControllerProtocol: BaseViewController {
    func setupView()
}

class LoginViewController: BaseViewController {

    var customView: LoginView?
    var presenter: LoginPresenter?

    init(with presenter: LoginPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.delegate = self
    }

    required convenience init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.isUserLogged()
    }
}

extension LoginViewController: LoginViewProtocol {
    func accessButtonTapped() {
        if let email = customView?.firebaseView?.mailTextField.text,
           let password = customView?.firebaseView?.passwordTextField.text {
            presenter?.accessButtonTapped(email: email, password: password)
        }
    }

    func registerButtonTapped() {
        presenter?.registerButtonTapped()
    }
}

extension LoginViewController: LoginViewControllerProtocol {
    func setupView() {
        self.customView = LoginView()
        guard let strongCustomView = customView else { return }
        strongCustomView.delegate = self

        view.addSubview(strongCustomView)
        customView?.autoPinEdgesToSuperviewEdges()
        navigationItem.hidesBackButton = true
    }
}
