//
//  QuizViewController.swift
//  Quiz-Ch_01
//
//  Created by Geoffrey Dudgeon on 10/5/15.
//  Copyright © 2015 Geoff Dudgeon. All rights reserved.
//

/*:

Creating your own ViewController (vs using auto-created one):

- Delete ViewController.swift
- File -> New File: iOS/Source/Cocoa Touch Class
- Class: QuizViewController: UI ViewController
- Attribute to Main.storyboard: Select VC icon, Utilities/Identity, Class -> QuizViewController

*/


import UIKit

class QuizViewController: UIViewController {
    
    
    //: MODEL
    // [_] may want to move this to own file to move data out of the controller
    let questions = [
        "From what is Cognac made?",
        "What is the capital of Vermont?",
        "What is 7 + 7"
    ]
    let answers = [
        "Grapes",
        "Montpelier",
        "14"
    ]
    var currentQuestionIndex: Int = 0    
    
    //: VIEW
    // Connections to --> Main.storyboard; Writing these out manually
    
    @IBOutlet var questionLabel: UILabel! // implicitly unwrapped
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var showAnswerButton: UIButton! // allow me to disable the showAnswerButton
    
    
    //: CONTROLLER

    
    // let's declare methods for our controls! writing these out manually
    
    @IBAction func showNextQuestion(sender: AnyObject){
        currentQuestionIndex++

        // make sure we don't overrun the Array
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        // update the questionLabel's text
        questionLabel.text = questions[currentQuestionIndex]
        answerLabel.text = "???"
        
        // re-enable the showAnswerButton
        showAnswerButton.enabled = true
        
    }
    
    @IBAction func showAnswer(send: AnyObject){
        answerLabel.text = answers[currentQuestionIndex]
        
        // disable the button
        showAnswerButton.enabled = false
    }
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // populate the first question
        questionLabel.text = questions[currentQuestionIndex]
        
        
    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
