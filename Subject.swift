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
    var questions: Array<Question>

    init?(subjectName: String, icon: UIImage?, subjectDescription: String, questions : Array<Question>) {
        self.subjectName = subjectName
        self.icon = icon
        self.subjectDescription = subjectDescription
        self.questions = questions
    }
}
