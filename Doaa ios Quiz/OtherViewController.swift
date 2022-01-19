//
//  OtherViewController.swift
//  Doaa ios Quiz
//
//  Created by Doaa Albishri on 07/12/2021.
//

import UIKit

class OtherViewController: UIViewController {
//@IBOutlet for labels
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
// variables to recive values from first screen (Quiz screen)
    var answer :String?
    var result :String?
    var score :String?
    var end = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // show correct or not quit view
        trueOrfalse()
        //check if is the end of quiz
        if(end == 1){
            view.backgroundColor = UIColor.black
            stateLabel.text = ("YOUR FINAL SCORE : \(score!) OUT OF 4")
            ScoreLabel.isHidden = true
            answerLabel.isHidden = true
        }
    
}
    // function for select any view is shown
    func trueOrfalse(){
        // if result correct
        if result == "CORRECT!!!"{
             view.backgroundColor = UIColor.blue
             answerLabel.text = "\(answer!)"
             stateLabel.text = "\(result!)"
             ScoreLabel.text = "\(score!)"
         }else{
             // if is not correct
             view.backgroundColor = UIColor.gray
             answerLabel.isHidden = true
             stateLabel.text = "\(result!)"
             ScoreLabel.isHidden = true
         }
    }
}
