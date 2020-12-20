//
//  DetailCell.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 19/12/2020.
//

import UIKit
import PureLayout

class DetailCell: UITableViewCell {
    let containerView = UIView(forAutoLayout: ())
    let titleLabel = UILabel(forAutoLayout: ())
    let detailLabel = UILabel(forAutoLayout: ())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setCell()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setCell() {
        containerView.addSubview(titleLabel)
        containerView.addSubview(detailLabel)
        addSubview(containerView)

        titleLabel.textColor = .customBlackColor
        titleLabel.font = UIFont(name: Fonts.robotoRegular, size: 16)

        detailLabel.textColor = .customDetailLabelColor
        detailLabel.font = UIFont(name: Fonts.robotoRegular, size: 14)
    }

    private func setConstraints() {
        titleLabel.autoPinEdge(.top, to: .top, of: containerView, withOffset: 32)
        titleLabel.autoPinEdge(.leading, to: .trailing, of: containerView, withOffset: 16)

        detailLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 8)
        detailLabel.autoPinEdge(.leading, to: .trailing, of: containerView, withOffset: 16)
    }

    func set(_ comic: ComicModel) {
        titleLabel.text = comic.name
        detailLabel.text = ":VVVV"
    }
}
