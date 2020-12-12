//
//  LoginPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import FirebaseAuth

class LoginPresenter {
    weak var delegate: LoginViewControllerProtocol?

    func autenticateUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email,
                               password: password) { (result, error) in
            if let _ = result, error == nil {
                self.delegate?.pushNextViewController()
            } else {
                self.delegate?.showError()
            }
        }
    }

    func registerButtonTapped() {
        delegate?.pushNextViewController()
    }
}
