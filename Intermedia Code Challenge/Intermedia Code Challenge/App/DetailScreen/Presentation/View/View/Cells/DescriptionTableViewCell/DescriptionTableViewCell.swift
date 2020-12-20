//
//  DescriptionTableViewCell.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    static let identifier = "DescriptionTableViewCell"
    @IBOutlet var descriptionLabel: UILabel!

    static func nib() -> UINib {
        return UINib(nibName: "DescriptionTableViewCell", bundle: nil)
    }

    public func configure(with description: String) {
        descriptionLabel.text = description
        descriptionLabel.font = UIFont(name: Fonts.robotoRegular, size: 14)
        descriptionLabel.textColor = .customDescriptionColor
        descriptionLabel.numberOfLines = 0
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
