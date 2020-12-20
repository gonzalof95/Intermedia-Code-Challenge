//
//  DetailViewController.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 19/12/2020.
//

import UIKit
import PureLayout

class DetailViewController: BaseViewController {
    var presenter: DetailPresenter?
    var comicsArray: [ComicsModel] = []
    var heroData: HeroModel
    var detailView: DetailView?

    init(with presenter: DetailPresenter, heroData: HeroModel) {
        self.heroData = heroData
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
        setNavBar(.customColorMain, hidesBackButton: false)
    }

    private func setupViewValues(_ hero: HeroModel, _ comics: [ComicsModel]) {
        comicsArray = comics
        heroData = hero
        setScreenTitle(title: hero.name)

        self.detailView = DetailView()
        guard let strongCustomView = detailView else { return }

        strongCustomView.tableView.delegate = self
        strongCustomView.tableView.dataSource = self
        view.addSubview(strongCustomView)
        detailView?.autoPinEdgesToSuperviewEdges()
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func setupView(_ hero: HeroModel, _ comics: [ComicsModel]) {
        setupViewValues(hero, comics)
    }

    func reloadTable(_ comics: [ComicsModel]) {
        comicsArray += comics
        presenter?.apiCalling = false
        detailView?.tableView.reloadData()
    }
}
