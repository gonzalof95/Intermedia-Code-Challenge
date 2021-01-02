//
//  HeroCellSnapshotTestCases.swift
//  Intermedia Code ChallengeTests
//
//  Created by Gonzalo Ivan Fuentes on 31/12/2020.
//

import XCTest
import SnapshotTesting
import PureLayout
@testable import Intermedia_Code_Challenge

final class HeroCellSnapshotTestCases: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testHeroCellInvoked() {
        let cell = HeroCell()

        setupConstraints(cell)
        setupCell(cell)
        assertSnapshot(matching: cell, as: .image)
    }
}

extension HeroCellSnapshotTestCases {
    func setupConstraints(_ cell: HeroCell) {
        cell.autoSetDimensions(to: CGSize(width: 280, height: 130))
    }

    func setupCell(_ cell: HeroCell) {
        let thumbnailMock = ThumbnailModel(path: "basePath/",
                                       imageExtension: "png")
        let heroMock = HeroModel(id: 1,
                             name: "Hero test cell",
                             description: "Hero test description for cell",
                             thumbnail: thumbnailMock)

        cell.set(heroMock)
    }
}
