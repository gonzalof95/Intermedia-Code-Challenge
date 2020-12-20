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
    var comicsArray: [ComicModel] = []

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
        comicsArray = comics

        setScreenTitle(title: hero.name)
        self.detailView = DetailView()
        guard let strongCustomView = detailView else { return }

        strongCustomView.tableView.delegate = self
        strongCustomView.tableView.dataSource = self

        view.addSubview(strongCustomView)
        detailView?.set(hero)
        detailView?.autoPinEdgesToSuperviewEdges()
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func setupView(_ hero: HeroModel, _ comics: [ComicModel]) {
        setupViewValues(hero, comics)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell") as! DetailCell
        let comic = comicsArray[indexPath.row]
        cell.set(comic)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
