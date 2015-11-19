//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Marco Cheng on 11/10/15.
//  Copyright © 2015 Marco Cheng. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var CorrectAnswer: UILabel!
    @IBOutlet weak var UserAnswer: UILabel!
    @IBOutlet weak var AnswerMsg: UILabel!

    
    var counter : Int?
    var questions : Array<Question>?
    var subject : Subject?
    var scores : Int?
    var answer : String?

    @IBOutlet weak var DoneBtn: UIButton!
    
    @IBOutlet weak var NextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            //CorrectAnswer.text = subject!.questions[counter!].answers[questions![counter!].correctAnswer]
            CorrectAnswer.text = ""
            UserAnswer.text = answer
            DoneBtn.hidden = true
            NextBtn.hidden = true
            checkAns()
    }
    
    func checkAns(){
        if(scores! == -1){
            scores = 0
        }
        
//        if(subject!.questions[counter!].answers[questions![counter!].correctAnswer] == answer){
//            scores = scores! + 1
//            AnswerMsg.text = "You nailed it!"
//        }else{
//            AnswerMsg.text = "Good try, but it's incorrect..."
//        }
//        
//        if(counter! == (subject?.questions.count)! - 1){
//            NextBtn.hidden = true
//            DoneBtn.hidden = false
//        }else{
//            NextBtn.hidden = false
//            DoneBtn.hidden = true
//        }

    }
    @IBAction func NextBtn(sender: UIButton) {
        self.performSegueWithIdentifier("NextQuestion", sender: sender)
    }

    @IBAction func DoneBtn(sender: UIButton)
    {
        //In this case the button IBAction takes a pointer to the button as a param.
        //Pass it on to the segue in case performWithSegue needs it.
        self.performSegueWithIdentifier("Done", sender: sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "NextQuestion"){
            let questionViewController = segue.destinationViewController as! QuestionViewController
                questionViewController.subject = subject
                questionViewController.counter = counter! + 1
                questionViewController.scores = scores!
        }else if(segue.identifier == "Done"){
            if(counter! == (subject?.questions.count)! - 1){
            let completeViewController = segue.destinationViewController as! CompleteViewController
                completeViewController.counter = counter
                completeViewController.scores = scores
            }
        }
    }
}
