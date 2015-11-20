//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Marco Cheng on 11/10/15.
//  Copyright © 2015 Marco Cheng. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var userAnswer : String = ""
    
    @IBOutlet weak var SubjectName: UILabel!
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var AnswerA: UILabel!
    @IBOutlet weak var AnswerB: UILabel!
    @IBOutlet weak var AnswerC: UILabel!
    @IBOutlet weak var AnswerD: UILabel!
    
    
    @IBAction func aButton(sender: UIButton) {
        userAnswer = AnswerA.text!
    }
    @IBAction func bButton(sender: UIButton) {
        userAnswer = AnswerB.text!
    }
    @IBAction func cButton(sender: UIButton) {
        userAnswer = AnswerC.text!
    }
    @IBAction func dButton(sender: UIButton) {
        userAnswer = AnswerD.text!
    }
    

    var counter : Int = 0
    var scores : Int = -1
    var questions : NSMutableArray!
    var question : AnyObject!
    var answers : Array<String>!
    var rightAnswer : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let questions = questions {
            question = questions[counter]
            questionField.text = String(question["text"]!!)
            AnswerA.text = String(question["answers"]!![0])
            AnswerB.text = String(question["answers"]!![1])
            AnswerC.text = String(question["answers"]!![2])
            AnswerD.text = String(question["answers"]!![3])
            let ansIndex = Int(String(question["answer"]!!))! - 1
            rightAnswer = String(question["answers"]!![ansIndex])
            print("correctAnswer: \(rightAnswer)")
     }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SubmitAnswer"){
            let answerViewController = segue.destinationViewController as! AnswerViewController
            answerViewController.questions = questions
            answerViewController.counter = counter
            answerViewController.scores = scores
            answerViewController.answer = userAnswer
            answerViewController.rightAnswer = rightAnswer
        }
    }
}
