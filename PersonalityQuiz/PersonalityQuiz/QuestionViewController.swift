//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Jestin Dorius on 2/10/25.
//

import UIKit

class QuestionViewController: UIViewController {
    
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleAnswerButton1: UIButton!
    @IBOutlet var singleAnswerButton2: UIButton!
    @IBOutlet var singleAnswerButton3: UIButton!
    @IBOutlet var singleAnswerButton4: UIButton!
    
    
    @IBOutlet var multiAnswerStackView: UIStackView!
    @IBOutlet var multiAnswerLabel1: UILabel!
    @IBOutlet var multiAnswerSwitch1: UISwitch!
    @IBOutlet var multiAnswerSwitch2: UISwitch!
    @IBOutlet var multiAnswerLabel2: UILabel!
    @IBOutlet var multiAnswerLabel3: UILabel!
    @IBOutlet var multiAnswerSwitch3: UISwitch!
    @IBOutlet var multiAnswerLabel4: UILabel!
    @IBOutlet var multiAnswerSwitch4: UISwitch!
    
    
    @IBOutlet var sliderStackView: UIStackView!
    @IBOutlet var sliderLabel1: UILabel!
    @IBOutlet var sliderLabel2: UILabel!
    @IBOutlet var rangedSlider: UISlider!
    
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var progressView: UIProgressView!
    
    //this is to store the answers so I can continue through the quiz
    var answersChosen: [Answers] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
        questionLabel.layer.cornerRadius = 20
        questionLabel.layer.masksToBounds = true
        multiAnswerStackView.layer.cornerRadius = 20
        multiAnswerStackView.layer.masksToBounds = true
        sliderLabel1.layer.cornerRadius = 6
        sliderLabel1.layer.masksToBounds = true
        sliderLabel2.layer.cornerRadius = 6
        sliderLabel2.layer.masksToBounds = true
    }
    
    @IBAction func singleAnswerButtonTapped(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answer
        
        switch sender {
        case singleAnswerButton1:
            answersChosen.append(currentAnswer[0])
        case singleAnswerButton2:
            answersChosen.append(currentAnswer[1])
        case singleAnswerButton3:
            answersChosen.append(currentAnswer[2])
        case singleAnswerButton4:
            answersChosen.append(currentAnswer[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBAction func multiAnswerSubmitButtonTapped() {
        let currentAnswers = questions[questionIndex].answer
        
        if multiAnswerSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiAnswerSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiAnswerSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiAnswerSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerSubmitButtonTapped() {
        let currentAnswers = questions[questionIndex].answer
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
       nextQuestion()
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multiAnswerStackView.isHidden = true
        sliderStackView.isHidden = true
        
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answer
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        progressView.setProgress(totalProgress, animated: true)
        
        
        
        switch currentQuestion.type {
        case .single:
            updateSingleStackAnswers(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .range:
            updateRangedStack(using: currentAnswers)
        }
        
        func updateSingleStackAnswers(using answers: [Answers]) {
            singleStackView.isHidden = false
            singleAnswerButton1.setTitle(answers[0].text, for: .normal)
            singleAnswerButton2.setTitle(answers[1].text, for: .normal)
            singleAnswerButton3.setTitle(answers[2].text, for: .normal)
            singleAnswerButton4.setTitle(answers[3].text, for: .normal)
        }
        
        func updateMultipleStack(using answers: [Answers]) {
            multiAnswerStackView.isHidden = false
            multiAnswerSwitch1.isOn = false
            multiAnswerSwitch2.isOn = false
            multiAnswerSwitch3.isOn = false
            multiAnswerSwitch4.isOn = false
            multiAnswerLabel1.text = answers[0].text
            multiAnswerLabel2.text = answers[1].text
            multiAnswerLabel3.text = answers[2].text
            multiAnswerLabel4.text = answers[3].text
        }
        
        func updateRangedStack(using answers: [Answers]) {
            sliderStackView.isHidden = false
            rangedSlider.setValue(0.5, animated: false)
            sliderLabel1.text = answers.first?.text
            sliderLabel2.text = answers.last?.text
        }
    }
    
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen)
    }
    
    var questionIndex = 0
    
    //the goal of the game is to find whether they are a PC gamer, playstation, xbox, or switch
    // playstain, xbox, switch, pc
    var questions: [Question] = [
        Question(
            text: "What is your go to relaxation technique?",
            type: .single,
            answer: [
                Answers(text: "Self-reflection", type: .fox),
                Answers(text: "Spending time connecting with others", type: .penguin),
                Answers(text: "Taking a nap", type: .hedgehog),
                Answers(text: "Learning more about a new topic", type: .elephant)
            ]
        ),
        Question(
            text: "How social are you in most situations?",
            type: .range,
            answer: [
                Answers(text: "I am not social active", type: .fox),
                Answers(text: "I am somewhat not social", type: .elephant),
                Answers(text: "I am somewhat social", type: .hedgehog),
                Answers(text: "I am very social", type: .penguin)
            ]
        ),
        Question(
            text: "What is you favorite weather?",
            type: .single,
            answer: [
                Answers(text: "Thunderstorms", type: .elephant),
                Answers(text: "Sunny days", type: .hedgehog),
                Answers(text: "Warm rain", type: .penguin),
                Answers(text: "Snowy days", type: .fox)
            ]
        ),
        Question(
            text: "When in the year were you born?",
            type: .range,
            answer: [
                Answers(text: "January", type: .fox),
                Answers(text: "April", type: .penguin),
                Answers(text: "October", type: .hedgehog),
                Answers(text: "December", type: .elephant)
            ]
        ),
        Question(
            text: "Which season do you enjoy the most?",
            type: .single,
            answer: [
                Answers(text: "Winter", type: .fox),
                Answers(text: "Fall", type: .elephant),
                Answers(text: "Spring", type: .penguin),
                Answers(text: "Summer", type: .hedgehog)
            ]
        ),
        Question(
            text: "What are your favorite holidays?",
            type: .multiple,
            answer: [
                Answers(text: "Christmas", type: .penguin),
                Answers(text: "Halloween", type: .fox),
                Answers(text: "New Years", type: .elephant),
                Answers(text: "Fourth of July", type: .hedgehog)
            ]
        ),
        Question(
            text: "How active are you usually?",
            type: .range,
            answer: [
                Answers(text: "I am not active", type: .fox),
                Answers(text: "I am somewhat in-active", type: .elephant),
                Answers(text: "I am somewhat active", type: .penguin),
                Answers(text: "I am very active", type: .hedgehog)
            ]
        ),
        
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
