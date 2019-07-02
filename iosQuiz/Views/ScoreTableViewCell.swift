//
//  ScoreTableViewCell.swift
//  iosQuiz
//
//  Created by Marko Barisic on 28/06/2019.
//  Copyright © 2019 Marko Barisic. All rights reserved.
//

import UIKit

struct ScoreCellData {
    var place: Int
    var user: String
    var score: Double
}

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func populate(with data: ScoreCellData) {
        placeLabel.text = "\(data.place)."
        userLabel.text = data.user
        scoreLabel.text = String(data.score)
    }
    
}
