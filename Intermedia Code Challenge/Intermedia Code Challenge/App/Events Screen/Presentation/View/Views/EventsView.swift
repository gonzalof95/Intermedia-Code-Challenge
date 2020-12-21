//
//  EventsView.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import UIKit
import PureLayout

class EventsView: UIView {
    var tableView = UITableView(forAutoLayout: ())

    required init() {
        super.init(frame: .zero)
        setView()
        registerTableViewCells()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        addSubview(tableView)

        tableView.separatorStyle = .none
        tableView.autoPinEdgesToSuperviewEdges()
    }

    private func registerTableViewCells() {
        tableView.register(EventsTableViewCell.nib(), forCellReuseIdentifier: "EventsTableViewCell")
    }
}
