//
//  SubjectTableViewCell.swift
//  iQuiz
//
//  Created by Marco Cheng on 11/3/15.
//  Copyright © 2015 Marco Cheng. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {

    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var subjectDescriptionLabel: UILabel!
    @IBOutlet weak var subjectIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    
}
