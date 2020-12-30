//
//  CustomTextViewSnapshotTestCases.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 30/12/2020.
//

import XCTest
import SnapshotTesting
import PureLayout
@testable import Intermedia_Code_Challenge

final class CustomTextFieldSnapshotTestCase: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testCustomTextField() {
        let view = CustomTextField()
        view.placeholder = "UI Testing Text" 

        setupConstraints(view)
        assertSnapshot(matching: view, as: .image)
    }
}

extension CustomTextFieldSnapshotTestCase {
    func setupConstraints(_ view: CustomTextField) {
        view.autoSetDimensions(to: CGSize(width: 200, height: 44))
    }
}
