//
//  TitleTableViewCell.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    static let identifier = "TitleTableViewCell"
    @IBOutlet var titleLabel: UILabel!

    static func nib() -> UINib {
        return UINib(nibName: "TitleTableViewCell", bundle: nil)
    }

    public func configure(with title: String) {
        titleLabel.text = title
        titleLabel.font = UIFont(name: Fonts.robotoCondensed, size: 20)
        titleLabel.textColor = .customBlackColor
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
