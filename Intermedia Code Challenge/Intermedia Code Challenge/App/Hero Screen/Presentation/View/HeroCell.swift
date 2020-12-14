//
//  HeroCell.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 13/12/2020.
//

import UIKit
import PureLayout

class HeroCell: UITableViewCell {
    let containerView = UIView(forAutoLayout: ())
    var iconImage = UIImageView(forAutoLayout: ())
    let nameLabel = UILabel(forAutoLayout: ())
    let descriptionLabel = UILabel(forAutoLayout: ())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setCell()
        setConstraints()
        set()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setCell() {
        containerView.addSubview(iconImage)
        containerView.addSubview(nameLabel)
        containerView.addSubview(descriptionLabel)
        addSubview(containerView)

        containerView.backgroundColor = .customWhiteColor
        containerView.layer.cornerRadius =  8

        iconImage.clipsToBounds = true
        iconImage.image = UIImage(named: "")

        nameLabel.textColor = .customBlackColor
        nameLabel.font = UIFont(name: Fonts.mainFont, size: 24)

        descriptionLabel.textColor = .customBlackColor
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: Fonts.mainFont, size: 14)
    }

    private func setConstraints() {
        iconImage.autoAlignAxis(.horizontal, toSameAxisOf: containerView)
        iconImage.autoPinEdge(.leading, to: .leading, of: containerView)
        iconImage.autoPinEdge(.top, to: .top, of: containerView)
        iconImage.autoPinEdge(.bottom, to: .bottom, of: containerView)
        iconImage.autoSetDimensions(to: CGSize(width: 120, height: 120))

        nameLabel.autoAlignAxis(.vertical, toSameAxisOf: containerView)
        nameLabel.autoPinEdge(.leading, to: .trailing, of: iconImage, withOffset: 16)
        nameLabel.autoPinEdge(.top, to: .top, of: containerView, withOffset: 17)

        descriptionLabel.autoAlignAxis(.vertical, toSameAxisOf: containerView)
        descriptionLabel.autoPinEdge(.leading, to: .trailing, of: iconImage, withOffset: 16)
        descriptionLabel.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 9)
        descriptionLabel.autoSetDimensions(to: CGSize(width: 178, height: 37))
    }

    private func setShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        clipsToBounds = true
    }

    func set() {
        iconImage.image = UIImage(named: "riko")
        nameLabel.text = ":VVVVVVVVVVVVVVV"
        descriptionLabel.text = "Using the power of the Infinity Stones, Thanos believes he can ultimately save the universe by wiping out half of its population."
    }
}
