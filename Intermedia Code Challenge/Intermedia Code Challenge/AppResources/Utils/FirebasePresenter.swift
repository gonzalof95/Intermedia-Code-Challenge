//
//  FirebasePresenter.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import Foundation
import FirebaseDatabase

class FirebasePresenter {
    func validateTextFields(email: String, password: String, delegate: BaseViewControllerProtocol) -> Bool {
        if email.isEmpty || password.isEmpty {
            delegate.showError(message: ErrorMessages.emptyField)
            return false
        } else if validateEmailAdress(email: email) && !password.isEmpty{
            return true
        } else {
            delegate.showError(message: ErrorMessages.invalidEmail)
            return false
        }
    }

    func validateEmailAdress(email: String) -> Bool {
        let REGEX: String
        REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluate(with: email)
    }

    func postUserToDatabase(email: String, userUID: String, delegate: BaseViewControllerProtocol) {
        let values = ["email": email]

        Database.database().reference().child("users").child(userUID).updateChildValues(values) { (error, ref) in
            if let error = error {
                print("Failed to update databse: ", error)
                return
            }
        }

        let presenter = MainPresenter()
        let viewController = MainViewController(with: presenter)
        delegate.pushNextViewController(viewController)
    }
}
