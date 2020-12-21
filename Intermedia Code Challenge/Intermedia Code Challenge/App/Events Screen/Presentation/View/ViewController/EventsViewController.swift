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
    var eventsArray: [EventsModel] = []
    var eventsView: EventsView?

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
        presenter?.viewLoaded()
    }

    private func setupNavBar() {
        setNavBar(.customColorMain, hidesBackButton: true)
        setScreenTitle()
    }

    private func setupTable(_ events: [EventsModel]) {
        eventsArray = events

        self.eventsView = EventsView()
        guard let strongCustomView = eventsView else { return }

        strongCustomView.tableView.delegate = self
        strongCustomView.tableView.dataSource = self
        view.addSubview(strongCustomView)
        eventsView?.autoPinEdgesToSuperviewEdges()
    }
}

extension EventsViewController: EventsViewControllerProtocol {
    func setupView(_ events: [EventsModel]) {
        setupTable(events)
    }
}

