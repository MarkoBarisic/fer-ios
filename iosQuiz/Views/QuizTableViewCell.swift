//
//  QuizTableViewCell.swift
//  iosQuiz
//
//  Created by Marko Barisic on 28/06/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import UIKit

struct QuizCellData {
    var imageUrl: String?
    var title: String
    var description: String?
    var level: Int
    
    init(imageUrl: String?, title: String, description: String?, level: Int) {
        self.imageUrl = imageUrl
        self.title = title
        self.description = description
        self.level = level
    }
    
}


class QuizTableViewCell: UITableViewCell {

    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.quizImage.layer.cornerRadius = self.quizImage.frame.width / 2
        self.quizImage.layer.masksToBounds = true
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func populate(with data: QuizCellData) {
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.description
        self.imageView?.image = UIImage(named: "delfile2")
        switch data.level {
        case 1:
            levelLabel.text = "*"
        case 2:
            levelLabel.text = "**"
        default:
            levelLabel.text = "***"
        }
    }
    
}
