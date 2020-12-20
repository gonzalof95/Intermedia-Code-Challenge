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
    var comicsArray: [ComicModel] = []
    var heroData: HeroModel
    let tableView = UITableView(forAutoLayout: ())

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

    private func setupViewValues(_ hero: HeroModel, _ comics: [ComicModel]) {
        comicsArray = comics
        heroData = hero

        setScreenTitle(title: hero.name)
        tableView.delegate = self
        tableView.dataSource = self

        registerTableViewCells()

        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewEdges()
    }

    private func registerTableViewCells() {
        tableView.register(ImageTableViewCell.nib(), forCellReuseIdentifier: "ImageTableViewCell")
        tableView.register(DescriptionTableViewCell.nib(), forCellReuseIdentifier: "DescriptionTableViewCell")
        tableView.register(TitleTableViewCell.nib(), forCellReuseIdentifier: "TitleTableViewCell")
        tableView.register(ComicTableViewCell.nib(), forCellReuseIdentifier: "ComicTableViewCell")
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func setupView(_ hero: HeroModel, _ comics: [ComicModel]) {
        setupViewValues(hero, comics)
    }
}
