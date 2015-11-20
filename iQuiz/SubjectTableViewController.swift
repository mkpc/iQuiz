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
    
    var subjects = [Dictionary<String, AnyObject>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        
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
                 self.subjects = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! [Dictionary<String, AnyObject>]
               }catch{
            }
        })
        task.resume()
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  self.subjects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SubjectTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SubjectTableViewCell
        let subject =  self.subjects[indexPath.row]
        cell.subjectLabel.text = String(subject["title"]!)
        cell.subjectDescriptionLabel.text = String(subject["desc"]!)
        let title = String(subject["title"]!)
        if(title == "Science!"){
            cell.subjectIcon.image = UIImage(named: "Sci")
        }else if(title == "Marvel Super Heroes"){
            cell.subjectIcon.image = UIImage(named: "SuperHero")
        }else if(title == "Mathematics"){
            cell.subjectIcon.image = UIImage(named: "Math")
        }
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
                let selectedSubject = self.subjects[indexPath.row]["questions"] as! NSMutableArray
                questionViewController.questions = selectedSubject
            }
        }
    }


}
