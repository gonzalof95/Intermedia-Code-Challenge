//
//  DetailView.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import UIKit
import PureLayout

class DetailView: UIView {
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
        tableView.register(ImageTableViewCell.nib(), forCellReuseIdentifier: "ImageTableViewCell")
        tableView.register(DescriptionTableViewCell.nib(), forCellReuseIdentifier: "DescriptionTableViewCell")
        tableView.register(TitleTableViewCell.nib(), forCellReuseIdentifier: "TitleTableViewCell")
        tableView.register(ComicTableViewCell.nib(), forCellReuseIdentifier: "ComicTableViewCell")
    }
}
