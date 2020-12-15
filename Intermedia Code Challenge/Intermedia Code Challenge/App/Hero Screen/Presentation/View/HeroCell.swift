//
//  HeroCell.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 13/12/2020.
//

import UIKit
import PureLayout

class HeroCell: UITableViewCell {
    let cellView = UIView(forAutoLayout: ())
    let containerView = UIView(forAutoLayout: ())
    var iconImage = UIImageView(forAutoLayout: ())
    let nameLabel = UILabel(forAutoLayout: ())
    let descriptionLabel = UILabel(forAutoLayout: ())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setCell()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setCell() {
        containerView.addSubview(iconImage)
        containerView.addSubview(nameLabel)
        containerView.addSubview(descriptionLabel)
        cellView.addSubview(containerView)
        addSubview(cellView)

        cellView.backgroundColor = .customBackgroundColor

        containerView.backgroundColor = .customWhiteColor
        containerView.setViewShadow()
        containerView.layer.cornerRadius =  8

        iconImage.clipsToBounds = true

        nameLabel.textColor = .customBlackColor
        nameLabel.font = UIFont(name: Fonts.mainFont, size: 24)

        descriptionLabel.textColor = .customBlackColor
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: Fonts.mainFont, size: 14)
    }

    private func setConstraints() {
        cellView.autoPinEdgesToSuperviewEdges()
        containerView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 4.5, left: 4.5, bottom: 4.5, right: 4.5))

        iconImage.autoAlignAxis(toSuperviewAxis: .horizontal)
        iconImage.autoSetDimensions(to: CGSize(width: 120, height: 120))
        iconImage.autoPinEdge(.top, to: .top, of: containerView)
        iconImage.autoPinEdge(.bottom, to: .bottom, of: containerView)
        iconImage.autoPinEdge(.leading, to: .leading, of: containerView)

        nameLabel.autoPinEdge(.top, to: .top, of: containerView, withOffset: 17)
        nameLabel.autoPinEdge(.leading, to: .trailing, of: iconImage, withOffset: 16)

        descriptionLabel.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 9)
        descriptionLabel.autoPinEdge(.leading, to: .trailing, of: iconImage, withOffset: 16)
        descriptionLabel.autoSetDimensions(to: CGSize(width: 178, height: 37))
    }

    func set() {
        iconImage.image = UIImage(named: "riko")
        nameLabel.text = "random hero name"
        descriptionLabel.text = "Using the power of the Infinity Stones, Thanos believes he can ultimately save the universe by wiping out half of its population."
    }
}