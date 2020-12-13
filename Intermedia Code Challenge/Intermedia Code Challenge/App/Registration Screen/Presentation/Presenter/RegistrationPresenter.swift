//
//  RegistrationPresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import FirebaseAuth

class RegistrationPresenter: FirebasePresenter {
    weak var delegate: BaseViewControllerProtocol?

    func autenticateUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email,
                               password: password) { (result, error) in
            if let error = error {
                print("Failed to sign in with error: ", error)
                self.delegate?.showError(message: ErrorMessages.couldNotRegister)
                return
            }

            guard let userUID = result?.user.uid,
                  let delegate = self.delegate else { return }

            self.postUserToDatabase(email: email, userUID: userUID, delegate: delegate)
        }
    }

    func registerButtonTapped(email: String, password: String) {
        guard let delegate = delegate else { return }
        if validateTextFields(email: email, password: password, delegate: delegate) {
            autenticateUser(email: email, password: password)
        }
    }
}
