//
//  FirebaseViewSnapshotTestCases.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 30/12/2020.
//

import XCTest
import SnapshotTesting
import PureLayout
@testable import Intermedia_Code_Challenge

final class FirebaseViewSnapshotTestCases: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testFirebaseViewInvoked() {
        let view = FirebaseView()

        setupConstraints(view)
        assertSnapshot(matching: view, as: .image)
    }
}

private extension FirebaseViewSnapshotTestCases {
    func setupConstraints(_ view: FirebaseView) {
        view.autoSetDimensions(to: CGSize(width: 230, height: 500))
    }
}
