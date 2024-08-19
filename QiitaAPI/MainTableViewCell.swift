//
//  MainTableViewCell.swift
//  QiitaAPI
//
//  Created by 吉原飛偉 on 2024/06/26.
//

import UIKit
import SDWebImage

class MainTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var ownerImageView: UIImageView! {
        didSet {
            ownerImageView.layer.cornerRadius = 10
            ownerImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var articleNameLabel: UILabel! {
        didSet {
            articleNameLabel.textColor = UIColor.link
        }
    }
    @IBOutlet weak var heartImageView: UIImageView! {
        didSet {
            heartImageView.image = UIImage(systemName: "heart")
        }
    }
    @IBOutlet weak var ownerNameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var heartCountLabel: UILabel!
    
    static let cellIdentifier = String(describing: MainTableViewCell.self)
    
    func configure(article: Article) {
             ownerNameLabel.text = article.user.name
            articleNameLabel.text = article.title
        if article.user.profileImageUrl != nil {
            ownerImageView.sd_setImage(with: URL(string: article.user.profileImageUrl ?? ""))
            } else {
                ownerImageView.image = nil
            }

            dateLabel.text = article.createdAt
        heartCountLabel.text = "\(String(describing: article.likesCount))"
            accessoryType = .disclosureIndicator
        }
}
