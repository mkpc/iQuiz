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
    
    var subject : Subject?
    var counter : Int = 0
    var questionCount : Int = 0
    var scores : Int = -1
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let subject = subject {
            questionCount = subject.questions.count
//            SubjectName.text = subject.subjectName
//            questionField.text = subject.questions[counter].questionName
//            AnswerA.text = subject.questions[counter].answerA
//            AnswerB.text = subject.questions[counter].answerB
//            AnswerC.text = subject.questions[counter].answerC
//            AnswerD.text = subject.questions[counter].answerD
            SubjectName.text = subject.subjectName
            questionField.text = ""
            AnswerA.text = ""
            AnswerB.text = ""
            AnswerC.text = ""
            AnswerD.text = ""
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    */

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SubmitAnswer"){
            let answerViewController = segue.destinationViewController as! AnswerViewController
            answerViewController.subject = subject
            answerViewController.counter = counter
            answerViewController.scores = scores
            answerViewController.answer = userAnswer
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
