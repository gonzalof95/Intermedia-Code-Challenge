//
//  EventsViewController.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 13/12/2020.
//

import UIKit
import PureLayout

class EventsViewController: BaseViewController {
    var presenter: EventsPresenter?

    init(with presenter: EventsPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        view.backgroundColor = .red
        presenter?.viewLoaded()
    }

    private func setupNavBar() {
        setNavBar(.customColorMain, hidesBackButton: true)
        setScreenTitle()
    }
}

extension EventsViewController: EventsViewControllerProtocol {
    func setupView() {
    }
}
