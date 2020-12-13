//
//  FactsViewController.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 13/12/2020.
//

import UIKit
import PureLayout

class FactsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        view.backgroundColor = .red
    }

    private func setupNavBar() {
        setNavBar(.customColorMain)
        navigationItem.hidesBackButton = true
        navigationItem.title = Constants.mainScreenTitle
    }
}
