//
//  HeroView.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 15/12/2020.
//

import UIKit
import PureLayout

class HeroView: UIView {
    var tableView = UITableView(forAutoLayout: ())

    required init() {
        super.init(frame: .zero)
        setView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        addSubview(tableView)

        tableView.rowHeight = 129
        tableView.separatorStyle = .none
        tableView.register(HeroCell.self, forCellReuseIdentifier: "cell")
        tableView.autoPinEdgesToSuperviewEdges()
    }
}
