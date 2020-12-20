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
    var heroView: HeroView?
    var heroesArray: [HeroModel] = []

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
        presenter?.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        setNavBar(.customColorMain, hidesBackButton: true)
        setScreenTitle()
    }

    private func setupTable(_ heroes: [HeroModel]) {
        heroesArray = heroes

        self.heroView = HeroView()
        guard let strongCustomView = heroView else { return }

        strongCustomView.tableView.delegate = self
        strongCustomView.tableView.dataSource = self
        view.addSubview(strongCustomView)
        heroView?.autoPinEdgesToSuperviewEdges()
    }
}

extension HeroViewController: HeroViewControllerProtocol {
    func setupView(_ heroes: [HeroModel]) {
        setupTable(heroes)
    }

    func reloadTable(_ heroes: [HeroModel]) {
        heroesArray += heroes
        presenter?.apiCalling = false
        heroView?.tableView.reloadData()
    }
}
