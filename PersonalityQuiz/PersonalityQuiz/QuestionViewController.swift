//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Jestin Dorius on 2/10/25.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var singleStackView: UIStackView!
    
    @IBOutlet var multiAnswerStackView: UIStackView!
    
    @IBOutlet var sliderStackView: UIStackView!
    
    @IBOutlet var questionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multiAnswerStackView.isHidden = true
        sliderStackView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        let currentQuestion = questions[questionIndex]
        switch currentQuestion.type {
        case .single:
            singleStackView.isHidden = false
        case .multiple:
            multiAnswerStackView.isHidden = false
        case .range:
            sliderStackView.isHidden = false
        }
        questionLabel.text = currentQuestion.text
    }
    
    var questionIndex = 0
    
    //the goal of the game is to find whether they are a PC gamer, playstation, xbox, or switch
    // playstain, xbox, switch, pc
    var questions: [Question] = [
        Question(
            text: "What is your go-to relaxation technique?",
            type: .single,
            answer: [
                Answers(text: "Selfreflection", type: .playstation),
                Answers(text: "Spending time connecting with others", type: .xbox),
                Answers(text: "Taking a nap", type: .ninSwitch),
                Answers(text: "Learning more about a new topic", type: .pc)
    ]
    ),
        Question(
            text: "Which season do you enjoy the most?",
            type: .single,
            answer: [
                Answers(text: "Winter", type: .pc),
                Answers(text: "Fall", type: .playstation),
                Answers(text: "Spring", type: .xbox),
                Answers(text: "Summer", type: .ninSwitch)
        ]),
        Question(
            text: "Why do you enjoy gaming?",
            type: .multiple,
            answer: [
                Answers(text: "Being around others", type: .xbox),
                Answers(text: "Stress-relief", type: .playstation),
                Answers(text: "Love just playing to enjoy the journey", type: .ninSwitch),
                Answers(text: "Challenging yourself to new situations", type: .pc)
    ]
    ),
        Question(
            text: "How social are you in most situations?",
            type: .range,
            answer: [
                Answers(text: "I am not social active", type: .playstation),
                Answers(text: "I am somewhat not social", type: .pc),
                Answers(text: "I am somewhat social", type: .ninSwitch),
                Answers(text: "I am very social", type: .xbox)
            ]),
//        Question(
//            text: "",
//            type: <#T##responseType#>,
//            answer: <#T##[Answers]#>)
        
    ]
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
