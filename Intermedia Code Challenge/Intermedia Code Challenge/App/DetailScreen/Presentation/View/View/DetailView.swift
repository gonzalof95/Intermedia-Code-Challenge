//
//  DetailView.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 19/12/2020.
//

import UIKit
import PureLayout
import SDWebImage

class DetailView: UIView {
    let imageView = UIImageView(forAutoLayout: ())
    let containerView = UIView(forAutoLayout: ())
    let scrollView = UIScrollView(forAutoLayout:())
    let descriptionLabel = UILabel(forAutoLayout: ())
    let titleLabel = UILabel(forAutoLayout: ())
    var tableView = UITableView(forAutoLayout: ())

    required init() {
        super.init(frame: .zero)

        setView()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setView() {
        self.backgroundColor = .customBackgroundColor

        scrollView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(tableView)
        addSubview(scrollView)

        imageView.clipsToBounds = true

        tableView.rowHeight = 88
        tableView.register(DetailCell.self, forCellReuseIdentifier: "detailCell")

        descriptionLabel.textColor = .customDescriptionColor
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: Fonts.robotoRegular, size: 14)

        titleLabel.textColor = .customBlackColor
        titleLabel.font = UIFont(name: Fonts.robotoCondensed, size: 20)
        titleLabel.text = TitleConstants.detailScreenTitle
    }

    private func setConstraints() {
        scrollView.autoPinEdgesToSuperviewEdges()
        containerView.autoPinEdgesToSuperviewEdges()

        containerView.autoMatch(.width, to: .width, of: self)
        containerView.autoMatch(.height, to: .height, of: self).priority = .defaultLow

        imageView.autoPinEdge(.top, to: .top, of: containerView)
        imageView.autoPinEdge(.leading, to: .leading, of: containerView)
        imageView.autoPinEdge(.trailing, to: .trailing, of: containerView)
        imageView.autoSetDimension(.height, toSize: 360)

        descriptionLabel.autoPinEdge(.top, to: .bottom, of: imageView, withOffset: 23)
        descriptionLabel.autoPinEdge(.leading, to: .leading, of: containerView, withOffset: 52)
        descriptionLabel.autoPinEdge(.trailing, to: .trailing, of: containerView, withOffset: -52)

        titleLabel.autoPinEdge(.top, to: .bottom, of: descriptionLabel, withOffset: 45)
        titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)

        tableView.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 14)
        tableView.autoPinEdge(.leading, to: .leading, of: containerView)
        tableView.autoPinEdge(.trailing, to: .trailing, of: containerView)
        tableView.autoPinEdge(.bottom, to: .bottom, of: containerView)
    }

    func set(_ hero: HeroModel) {
        descriptionLabel.text = hero.description
        imageView.sd_setImage(with: URL(string: hero.thumbnail.path + "." + hero.thumbnail.imageExtension), placeholderImage: UIImage(named: "blank"))
    }
}
