//
//  CompleteViewController.swift
//  iQuiz
//
//  Created by Marco Cheng on 11/10/15.
//  Copyright © 2015 Marco Cheng. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    @IBOutlet weak var ResultNotice: UILabel!
    @IBOutlet weak var Scores: UILabel!
    @IBOutlet weak var totalQuestion: UILabel!
    
    var scores : Int?
    var counter : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getScore ()
        
        // Do any additional setup after loading the view.
    }
    
    func getScore (){
        counter = counter! + 1
        if scores! > (counter! / 2){
            ResultNotice.text = "Congratulations, you pass the test!"
        }else{
            ResultNotice.text = "You just fail the test..."
        }
        
        Scores.text = String(scores!)
        totalQuestion.text = String(counter!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
