//
//  HeroViewController.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 10/12/2020.
//

import UIKit
import PureLayout

class HeroViewController: BaseViewController {

    var presenter: HeroPresenter?
    var tableView = UITableView(forAutoLayout: ())
    var heroArray: [HeroModel] = []

    init(with presenter: HeroPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.delegate = self
    }

    required convenience init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        presenter?.viewLoaded()
    }

    private func setupNavBar() {
        setNavBar(.customColorMain)
    }

    private func setupTable() {
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 129
        tableView.separatorStyle = .none
        tableView.autoPinEdgesToSuperviewEdges()
        tableView.register(HeroCell.self, forCellReuseIdentifier: "cell")
    }
}

extension HeroViewController: HeroViewControllerProtocol {
    func setupView() {
        setupNavBar()
        setupTable()
    }
}

extension HeroViewController: UITableViewDelegate, UITableViewDataSource {
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
