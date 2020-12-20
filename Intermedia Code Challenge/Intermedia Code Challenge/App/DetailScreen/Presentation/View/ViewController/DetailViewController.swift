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
        view.backgroundColor = .cyan
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

        tableView.register(ImageTableViewCell.nib(), forCellReuseIdentifier: "ImageTableViewCell")
        tableView.register(DescriptionTableViewCell.nib(), forCellReuseIdentifier: "DescriptionTableViewCell")
        tableView.register(TitleTableViewCell.nib(), forCellReuseIdentifier: "TitleTableViewCell")
        tableView.register(ComicTableViewCell.nib(), forCellReuseIdentifier: "ComicTableViewCell")

        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewEdges()
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func setupView(_ hero: HeroModel, _ comics: [ComicModel]) {
        setupViewValues(hero, comics)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicsArray.count + 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier) as! ImageTableViewCell
            let imageurl = heroData.thumbnail.path + "." + heroData.thumbnail.imageExtension
            cell.configure(with: imageurl)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier) as! DescriptionTableViewCell
            cell.configure(with: heroData.description)
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier) as! TitleTableViewCell
            cell.configure(with: TitleConstants.detailScreenTitle)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ComicTableViewCell.identifier) as! ComicTableViewCell
            cell.configure(with: comicsArray[indexPath.row - 3].name, subtitle: "1990")
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
