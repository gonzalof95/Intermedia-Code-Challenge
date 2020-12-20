//
//  ImageTableViewCell.swift
//  Intermedia Code Challenge
//
//  Created by Gonzalo Ivan Fuentes on 20/12/2020.
//

import UIKit
import SDWebImage

class ImageTableViewCell: UITableViewCell {
    static let identifier = "ImageTableViewCell"
    @IBOutlet var heroImageView: UIImageView!

    static func nib() -> UINib {
        return UINib(nibName: "ImageTableViewCell", bundle: nil)
    }

    public func configure(with imageUrl: String) {
        heroImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "blank"))
        heroImageView.contentMode = .scaleAspectFill
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
