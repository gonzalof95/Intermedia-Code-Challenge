//
//  CustomButtonSnapshotTestCases.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 30/12/2020.
//

import XCTest
import SnapshotTesting
import PureLayout
@testable import Intermedia_Code_Challenge

final class CustomButtonSnapshotTestCases: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testMainCustomButtonActivated() {
        let button = CustomButton()
        setupStyle(button)
        button.activate()

        setupConstraints(button)
        assertSnapshot(matching: button, as: .image)
    }

    func testMainCustomButtonDeactivated() {
        let button = CustomButton()
        setupStyle(button)
        button.deactivate()

        setupConstraints(button)
        assertSnapshot(matching: button, as: .image)
    }
}

extension CustomButtonSnapshotTestCases {
    func setupConstraints(_ button: CustomButton) {
        button.autoSetDimensions(to: CGSize(width: 200, height: 44))
    }

    func setupStyle(_ button: CustomButton) {
        button.setColor(color: .customMainButtonColor)
        button.setTitle("Button test", for: .normal)
    }
}
