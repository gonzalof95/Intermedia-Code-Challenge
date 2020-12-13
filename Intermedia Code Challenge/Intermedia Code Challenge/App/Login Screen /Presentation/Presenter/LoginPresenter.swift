//
//  LoginPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import FirebaseAuth

class LoginPresenter: FirebasePresenter {
    weak var delegate: LoginViewControllerProtocol?

    func isUserLogged() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                self.delegate?.setupView()
            }
        } else {
            delegate?.presentMainScreen()
        }
    }

    func autenticateUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email,
                               password: password) { (result, error) in
            if let error = error {
                print("Failed to sign in with error: ", error)
                self.delegate?.showError(message: ErrorMessages.couldNotLog)
                return
            }

            guard let userUID = result?.user.uid,
                  let delegate = self.delegate else { return }

            self.postUserToDatabase(email: email, userUID: userUID, delegate: delegate)
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
