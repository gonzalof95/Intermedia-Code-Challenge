//
//  EventsViewController.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 13/12/2020.
//

import UIKit
import PureLayout

class EventsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        view.backgroundColor = .red
    }

    private func setupNavBar() {
        setNavBar(.customColorMain)
    }
}
