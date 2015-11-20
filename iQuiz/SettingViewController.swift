//
//  SettingViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/19/15.
//  Copyright © 2015 Marco Cheng. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var URL: UITextField!
    
    var urlPath : String = "http://tednewardsandbox.site44.com/questions.json"
    
    @IBAction func Check(sender: AnyObject) {
        //URL.text = urlPath
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        URL.text = urlPath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "setting"){
            let subjectTableViewController = segue.destinationViewController as! SubjectTableViewController
                subjectTableViewController.urlPath = URL.text
        }
    }
}
