//
//  RegistrationViewController.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 12/12/2020.
//

import UIKit
import PureLayout

class RegistrationViewController: BaseViewController {

    var customView: RegisterView?

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
        customView?.registerButton.shake()
    }
}
