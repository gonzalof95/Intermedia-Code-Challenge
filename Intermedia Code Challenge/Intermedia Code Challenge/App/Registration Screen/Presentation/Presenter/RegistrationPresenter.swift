//
//  RegistrationPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import FirebaseAuth

class RegistrationPresenter: BasePresenter {
    weak var delegate: BaseViewControllerProtocol?

    func autenticateUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email,
                               password: password) { (result, error) in
            if let _ = result, error == nil {
                let viewController = MainViewController()
                self.delegate?.pushNextViewController(viewController)
            } else {
                self.delegate?.showError(message: ErrorMessages.couldNotRegister)
            }
        }
    }

    func registerButtonTapped(email: String, password: String) {
        guard let delegate = delegate else { return }
        if validateTextFields(email: email, password: password, delegate: delegate) {
            autenticateUser(email: email, password: password)
        }
    }
}
