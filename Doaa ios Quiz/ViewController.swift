//
//  ViewController.swift
//  Doaa ios Quiz
//
//  Created by Doaa Albishri on 07/12/2021.
//

import UIKit
// view controller for screen 1 (Quiz)
class ViewController: UIViewController {
// variable to store question , index , score , correct answer , result , prograss value , end the quizS
    var currentQustion: Quiz?
    var currentIndex: Int = 0
    var score: Int = 0
    var CorrectAnswer :String!
    var Result :String!
    var pValue :Float = 0
    var end = 0
// struct for Quiz
    struct Quiz
     {
         let Qustion : String!
         let Answers : [String]!
         let CorrectAnswer :Int!
         
     }
// array of Quiz Struct
    var quizBank :[Quiz] = [
        Quiz(Qustion: "When OOP concept did first came into picture?", Answers: ["1980’s","1995","1970’s","1993"],CorrectAnswer: 2),
        Quiz(Qustion: "Who invented OOP?", Answers: ["Andrea Ferro","Adele Goldberg","Alan Kay","Dennis Ritchie"],CorrectAnswer: 2),
        Quiz(Qustion: "Which is not a feature of OOP in general definitions?", Answers: [ "Efficient Code","Code reusability","Modularity","Duplicate/Redundant data"],CorrectAnswer: 3),
        Quiz(Qustion: "Which was the first purely object oriented programming language developed?", Answers: ["Kotlin","SmallTalk","Java","C++"],CorrectAnswer: 1)
        ]
    // button IBOutlets
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    // buttons @IBAction when user pressed to any button
    @IBAction func buttonPressed(_ sender: UIButton) {
        // switch to button tag
        switch(sender.tag){
        case 1 :answers(userAnswer: 0)
        case 2 :answers(userAnswer: 1)
        case 3 :answers(userAnswer: 2)
        case 4 :answers(userAnswer: 3)
        default: print("error")
        }
    }
    // @IBOutlet connection for progress bar and question label
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // change corner of the question Label
        self.questionLabel.layer.cornerRadius = 8
        // start fist Question
        currentQustion = quizBank[0]
        // set Qustion
        qustions()
    }
    
    // function to set questions and chocies
    func qustions(){
        questionLabel?.text = (currentQustion!.Qustion)
        b1?.setTitle((currentQustion!.Answers[0]), for: .normal)
        b2?.setTitle((currentQustion!.Answers[1]), for: .normal)
        b3?.setTitle((currentQustion!.Answers[2]), for: .normal)
        b4?.setTitle((currentQustion!.Answers[3]), for: .normal)
    }
 
 // function to check the answer is Correct / Not correct
 func answers (userAnswer: Int){
     if(userAnswer == currentQustion!.CorrectAnswer){
         // increase score
         score += 1
         CorrectAnswer = (currentQustion!.Answers[userAnswer])
         Result = "CORRECT!!!"
         // increase progress bar value
         pValue += 0.25
         progressBar.setProgress(pValue, animated: true)
         // go to Result Screen
          performSegue(withIdentifier: "Segue", sender: nil)
     }else{
         Result = "NOT QUIT!"
         // go to Result Screen
         performSegue(withIdentifier: "Segue", sender: nil)
     }
     // start next Question
     nextQustion()
 }
 
 // function to go to the next question
 func nextQustion(){
     if (currentIndex < quizBank.count - 1){
         currentIndex += 1
         currentQustion = quizBank[currentIndex]
         qustions()
         if(currentIndex==3){
             // end the quiz
             end = 1
             // go to Result Screen
             performSegue(withIdentifier: "Segue", sender: nil)
         }
     }
    
}
    // send values to next screeen (Result screen)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! OtherViewController
        destination.answer = CorrectAnswer
        destination.result = Result
        destination.score = String(score)
        destination.end = end
    }    
}
