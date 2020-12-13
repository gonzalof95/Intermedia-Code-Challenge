//
//  MainViewController.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 10/12/2020.
//

import UIKit
import PureLayout

class MainViewController: BaseViewController {

    var presenter: MainPresenter?

    init(with presenter: MainPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.delegate = self
    }

    required convenience init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }

    private func setupNavBar() {
        setNavBar(.customColorMain)
        navigationItem.hidesBackButton = true
        navigationItem.title = Constants.mainScreenTitle
    }
}

extension MainViewController: MainViewControllerProtocol {
    func setupView() {
        setupNavBar()
    }
}
