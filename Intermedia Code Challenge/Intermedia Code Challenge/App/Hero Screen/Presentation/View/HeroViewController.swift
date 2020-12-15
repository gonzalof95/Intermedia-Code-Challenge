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
    var heroArray: [HeroModel] = []//TODO: sacarlo cuando lo tenga en el presenter

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
        self.heroView = HeroView(with: heroArray)
        guard let strongCustomView = heroView else { return }

        view.addSubview(strongCustomView)
        heroView?.autoPinEdgesToSuperviewEdges()
    }
}

extension HeroViewController: HeroViewControllerProtocol {
    func setupView() {
        setupNavBar()
        setupTable()
    }
}
