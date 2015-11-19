//
//  SubjectTableViewController.swift
//  iQuiz
//
//  Created by Marco Cheng on 11/3/15.
//  Copyright © 2015 Marco Cheng. All rights reserved.
//

import UIKit

class SubjectTableViewController: UITableViewController {

    @IBOutlet weak var setting: UIBarButtonItem!
    
    @IBAction func settingAlert(sender: AnyObject) {
        let alert = UIAlertController(title: "Setting", message: "Settings go here!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    var subjects = [Subject]()
    var questionMath = [Question]()
    var questionHero = [Question]()
    var questionSci = [Question]()
    var jsonData = [Dictionary<String, AnyObject>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSubject()
        testDownloadTask()
        let backgroundView = UIView(frame: CGRectZero)
         self.tableView.tableFooterView = backgroundView
    }

    
    func testDownloadTask(){
        let urlPath = "http://tednewardsandbox.site44.com/questions.json"
        let url: NSURL = NSURL(string: urlPath)!
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            
            if error != nil {
                // If there is an error in the web request, print it to the console
                print(error!.localizedDescription)
            }
            
            var _: NSError?
            
            do{
                 self.jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! [Dictionary<String, AnyObject>]
                print(self.jsonData)
                self.getSubject()
            }catch{
            }
        })
        task.resume()
        
    }

    func getSubject(){
        var subjectDic : Dictionary<String, AnyObject>
        var title : String = ""
        var desc : String = ""
        
        var questions : [Question]
        

        var questionDic : Dictionary<String, AnyObject>
        var questionText : String = ""
        var answer : String = ""
        var answers : NSMutableArray
        var subjects : Array<Subject>
        
        //loop
        //for(var subjectInx = 0 ; subjectInx < self.jsonData.count ; subjectInx++){
            subjectDic = self.jsonData[1]
            title = String(subjectDic["title"])
            desc = String(subjectDic["desc"])
            questions = subjectDic["questions"] as! [Question]
        
        
            //loop
            questionDic = questions[0] as! Dictionary<String, AnyObject>
            answer = String(questionDic["answer"])
            answers = questionDic["answers"] as! NSMutableArray
            questionText = String(questionDic["text"])
            
          //  var question = Question(questionName: questionText, correctAnswer: answer, answers: answers)
         //   subjects.append(question)
            
        //}
        
        
    }
    
    
    
    
    func loadSubject() {

        let icon1 = UIImage(named: "Math")!
        

//        let question1 = Question(questionName: "1 + 1 = ?", answerA: "1", answerB: "2", answerC: "3", answerD: "4", correctAnswer: "2")
//        let question2 = Question(questionName: "5 + 2 = ?", answerA: "7", answerB: "12", answerC: "8", answerD: "11", correctAnswer: "7")
//        let question3 = Question(questionName: "63 - 8 = ?", answerA: "55", answerB: "66", answerC: "54", answerD: "49", correctAnswer: "55")
//        let question4 = Question(questionName: "13 + 4 = ?", answerA: "17", answerB: "22", answerC: "35", answerD: "24", correctAnswer: "17")
//        let question5 = Question(questionName: "2 X 5 = ?", answerA: "12", answerB: "15", answerC: "20", answerD: "10", correctAnswer: "10")
//        questionMath = [question1!, question2!, question3!, question4!, question5!]
//        let subject1 = Subject(subjectName: "Mathematics", icon: icon1, subjectDescription: "Questions about Math!",questions: questionMath)!
        
        
        let icon2 = UIImage(named: "SuperHero")!
//        let question6 = Question(questionName: "Who is the one person who can calm The Hulk down?", answerA: "Betty Ross", answerB: "His Mom", answerC: "Rose Banner", answerD: "Betsy Rose", correctAnswer: "Betty Ross")
//        let question7 = Question(questionName: "Which villain did Jim Carrey play in Batman Forever?", answerA: "Poison Ivy", answerB: "The Penguin", answerC: "The Joker", answerD: "The Riddler", correctAnswer: "The Riddler")
//        let question8 = Question(questionName: "Who is Batman's alter ego?", answerA: "Bruce Banner.", answerB: "Clark Kent", answerC: "Peter Parker", answerD: "Bruce Wayne", correctAnswer: "Bruce Wayne")
//        questionHero = [question6!, question7!, question8!]
//        let subject2 = Subject(subjectName: "Marvel Super Heroes", icon: icon2, subjectDescription: "Questions about Heroes", questions: questionHero)!

        
        
        let icon3 = UIImage(named: "Sci")!
//        let question9 = Question(questionName: "Which kind of waves are used to make and receive cellphone calls?", answerA: "X-Ray", answerB: "Radio waves", answerC: "Light waves", answerD: "Sound waves", correctAnswer: "Radio waves")
//        let question10 = Question(questionName: "Which earth layer is the hottest?", answerA: "Crust layer", answerB: "Mantle layer", answerC: "Core layer", answerD: "All", correctAnswer: "Core layer")
//        let question11 = Question(questionName: "Which of these is the main way that ocean tides are created?", answerA: "Rotation of the Earth", answerB: "Gravitational from Moon", answerC: "Gravitational from Sun", answerD: "Gravitational from Me", correctAnswer: "Gravitational from Moon")
//        questionSci = [question9!, question10!, question11!]
//        let subject3 = Subject(subjectName: "Science", icon: icon3, subjectDescription: "Questions about Science", questions: questionSci)!
//        
        //subjects += [subject1, subject2, subject3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SubjectTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SubjectTableViewCell
        let subject = subjects[indexPath.row]
        
   
        cell.subjectLabel.text = subject.subjectName
        cell.subjectIcon.image = subject.icon
        cell.subjectDescriptionLabel.text = subject.subjectDescription
        
        return cell
    }
    
      
  
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation*/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowQuestion"){
            let questionViewController = segue.destinationViewController as! QuestionViewController
            
            // Get the cell that generated this segue.
            if let selectedSubjectCell = sender as? SubjectTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedSubjectCell)!
                let selectedSubject = subjects[indexPath.row]
                questionViewController.subject = selectedSubject
            }
        }

        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
