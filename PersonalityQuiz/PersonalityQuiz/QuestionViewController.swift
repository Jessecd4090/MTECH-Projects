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
                Answers(text: "Self-reflection", type: .playstation),
                Answers(text: "Spending time connecting with others", type: .xbox),
                Answers(text: "Taking a nap", type: .ninSwitch),
                Answers(text: "Learning more about a new topic", type: .pc)
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
            ]
        ),
        Question(
            text: "What color do you identify with best?",
            type: .single,
            answer: [
                Answers(text: "Black", type: .pc),
                Answers(text: "Red", type: .ninSwitch),
                Answers(text: "Yellow", type: .xbox),
                Answers(text: "Blue", type: .playstation)
            ]
        ),
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
            text: "Which season do you enjoy the most?",
            type: .single,
            answer: [
                Answers(text: "Winter", type: .playstation),
                Answers(text: "Fall", type: .pc),
                Answers(text: "Spring", type: .xbox),
                Answers(text: "Summer", type: .ninSwitch)
            ]
        ),
        Question(
            text: "What is your favorite holiday?",
            type: .multiple,
            answer: [
                Answers(text: "Christmas", type: .xbox),
                Answers(text: "Halloween", type: .playstation),
                Answers(text: "New Years", type: .pc),
                Answers(text: "Fourth of July", type: .ninSwitch)
            ]
        ),
        Question(
            text: "How active are you usually?",
            type: .range,
            answer: [
                Answers(text: "I am not active", type: .playstation),
                Answers(text: "I am somewhat in-active", type: .pc),
                Answers(text: "I am somewhat active", type: .xbox),
                Answers(text: "I am very active", type: .ninSwitch)
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
