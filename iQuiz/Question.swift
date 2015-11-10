//
//  Question.swift
//  iQuiz
//
//  Created by Marco Cheng on 11/9/15.
//  Copyright © 2015 Marco Cheng. All rights reserved.
//

import UIKit

class Question: NSObject {
    
    var questionName: String
    var answerA: String
    var answerB: String
    var answerC: String
    var answerD: String
    var correctAnswer: String
    
    init?(questionName: String, answerA: String, answerB: String, answerC: String, answerD: String, correctAnswer: String) {
        self.questionName = questionName
        self.answerA = answerA
        self.answerB = answerB
        self.answerC = answerC
        self.answerD = answerD
        self.correctAnswer = correctAnswer
    }
}
