//
//  Question.swift
//  iQuiz
//
//  Created by Marco Cheng on 11/9/15.
//  Copyright © 2015 Marco Cheng. All rights reserved.
//

//questionName = text
//correctAnswer = answer
//

import UIKit

class Question: NSObject {
    
    var questionName: String
    var correctAnswer: String
    var answers : NSMutableArray
    
    init?(questionName: String, correctAnswer: String, answers :  NSMutableArray) {
        self.questionName = questionName
        self.correctAnswer = correctAnswer
        self.answers = answers
    }
}
