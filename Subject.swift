//
//  Subject.swift
//  iQuiz
//
//  Created by Marco Cheng on 11/3/15.
//  Copyright © 2015 Marco Cheng. All rights reserved.
//

import UIKit

class Subject: NSObject {
    
    var subjectName: String
    var icon: UIImage?
    var subjectDescription: String

    init?(subjectName: String, icon: UIImage?, subjectDescription: String) {
        self.subjectName = subjectName
        self.icon = icon
        self.subjectDescription = subjectDescription
    }
}
