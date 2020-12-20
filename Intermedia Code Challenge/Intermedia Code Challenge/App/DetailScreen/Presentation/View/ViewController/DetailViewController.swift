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
    var detailView: DetailView?

    init(with presenter: DetailPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        self.presenter?.delegate = self
    }

    required convenience init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        presenter?.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        setNavBar(.customColorMain, hidesBackButton: false)
    }

    private func setupViewValues(_ hero: HeroModel, _ comics: [ComicModel]) {
        setScreenTitle(title: hero.name)
        self.detailView = DetailView()
        guard let strongCustomView = detailView else { return }

        view.addSubview(strongCustomView)
        detailView?.autoPinEdgesToSuperviewEdges()
        detailView?.set(hero)
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func setupView(_ hero: HeroModel, _ comics: [ComicModel]) {
        setupViewValues(hero, comics)
    }
}
