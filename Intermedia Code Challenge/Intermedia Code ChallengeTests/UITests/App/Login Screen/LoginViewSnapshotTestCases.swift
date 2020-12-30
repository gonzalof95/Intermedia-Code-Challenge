//
//  LoginViewSnapshotTestCases.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 30/12/2020.
//

import XCTest
import SnapshotTesting
import PureLayout
@testable import Intermedia_Code_Challenge

final class LoginViewSnapshotTestCases: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testLoginViewInvoked() {
        let view = LoginView()

        setupConstraints(view)
        setupButton(view.registerButton, color: .customMainButtonColor)
        setupButton(view.accessButton, color: .customSecondButtonColor)
        assertSnapshot(matching: view, as: .image)
    }
}

extension LoginViewSnapshotTestCases {
    func setupConstraints(_ view: LoginView) {
        view.autoSetDimensions(to: CGSize(width: 280, height: 600))
    }

    func setupButton(_ button: CustomButton, color: UIColor) {
        button.setTitle("Button for UI Test", for: .normal)
        button.activate()
        button.setColor(color: color)
        button.autoSetDimension(.height, toSize: 44)
    }
}
