//
//  LoginPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import FirebaseAuth

class LoginPresenter: BasePresenter {
    weak var delegate: BaseViewControllerProtocol?

    func autenticateUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email,
                               password: password) { (result, error) in
            if let _ = result, error == nil {
                let viewController = MainViewController()
                self.delegate?.pushNextViewController(viewController)
            } else {
                self.delegate?.showError(message: ErrorMessages.couldNotLog)
            }
        }
    }

    func registerButtonTapped() {
        let presenter = RegistrationPresenter()
        let viewController = RegistrationViewController(with: presenter)
        delegate?.pushNextViewController(viewController)
    }

    func accessButtonTapped(email: String, password: String) {
        guard let delegate = delegate else { return }
        if validateTextFields(email: email, password: password, delegate: delegate) {
            autenticateUser(email: email, password: password)
        }
    }
}
