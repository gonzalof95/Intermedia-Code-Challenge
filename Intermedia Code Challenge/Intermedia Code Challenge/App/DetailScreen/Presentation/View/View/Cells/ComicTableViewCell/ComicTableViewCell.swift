//
//  ComicTableViewCell.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import UIKit

class ComicTableViewCell: UITableViewCell {

    static let identifier = "ComicTableViewCell"
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!

    static func nib() -> UINib {
        return UINib(nibName: "ComicTableViewCell", bundle: nil)
    }

    public func configure(with title: String, subtitle: String) {
        titleLabel.text = title
        titleLabel.font = UIFont(name: Fonts.robotoRegular, size: 16)
        titleLabel.textColor = .customBlackColor

        subtitleLabel.text = subtitle
        subtitleLabel.font = UIFont(name: Fonts.robotoRegular, size: 14)
        subtitleLabel.textColor = .customDetailLabelColor
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
