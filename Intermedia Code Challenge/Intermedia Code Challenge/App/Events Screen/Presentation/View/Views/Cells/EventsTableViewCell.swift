//
//  EventsTableViewCell.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import UIKit
import SDWebImage
import PureLayout

class EventsTableViewCell: UITableViewCell {

    static let identifier = "EventsTableViewCell"
    @IBOutlet var eventImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var startLabel: UILabel!
    @IBOutlet var endLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var containerView: UIView!

    static func nib() -> UINib {
        return UINib(nibName: "EventsTableViewCell", bundle: nil)
    }

    public func configure(with event: EventsModel) {
        let imageUrl = event.thumbnail.path + "." + event.thumbnail.imageExtension

        eventImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "blank"))
        eventImageView.contentMode = .scaleAspectFill
        eventImageView.layer.cornerRadius = 10

        titleLabel.text = event.title
        titleLabel.font = UIFont(name: Fonts.robotoCondensed, size: 24)
        titleLabel.textColor = .customBlackColor

        startLabel.text = event.start
        startLabel.font = UIFont(name: Fonts.robotoRegular, size: 14)
        startLabel.textColor = .customDescriptionColor

        endLabel.text = event.end
        endLabel.font = UIFont(name: Fonts.robotoRegular, size: 14)
        endLabel.textColor = .customDescriptionColor

        containerView.layer.cornerRadius = 8
        contentView.backgroundColor = .customBackgroundColor
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
