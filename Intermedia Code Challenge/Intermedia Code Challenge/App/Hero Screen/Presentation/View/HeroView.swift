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
    var heroArray: [HeroModel]

    required init(with array: [HeroModel]) {
        self.heroArray = array
        super.init(frame: .zero)
        setView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 129
        tableView.separatorStyle = .none
        tableView.register(HeroCell.self, forCellReuseIdentifier: "cell")
        tableView.autoPinEdgesToSuperviewEdges()
    }
}

extension HeroView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HeroCell

        cell.set()

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
