//
//  RegisterViewSnapshotTestCases.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 31/12/2020.
//

import XCTest
import SnapshotTesting
import PureLayout
@testable import Intermedia_Code_Challenge

final class RegisterViewSnapshotTestCases: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testRegisterViewInvoked() {
        let view = RegisterView()

        setupConstraints(view)
        setupButton(view.registerButton, color: .customMainButtonColor)
        assertSnapshot(matching: view, as: .image)
    }
}

extension RegisterViewSnapshotTestCases {
    func setupConstraints(_ view: RegisterView) {
        view.autoSetDimensions(to: CGSize(width: 280, height: 600))
    }

    func setupButton(_ button: CustomButton, color: UIColor) {
        button.setTitle("Button for UI Test", for: .normal)
        button.activate()
        button.setColor(color: color)
        button.autoSetDimension(.height, toSize: 44)
    }
}
