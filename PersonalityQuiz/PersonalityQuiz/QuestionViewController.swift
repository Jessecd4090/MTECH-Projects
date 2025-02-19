//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Jestin Dorius on 2/10/25.
//

import UIKit

class QuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    var questions: [Question] = [
        Question(
            text: "Which food do you like the most?",
            type: .single,
            answer: [
        Answers(text: "Steak", type: .lion),
        Answers(text: "Fish", type: .cat),
        Answers(text: "Carrots", type: .rabbit),
        Answers(text: "Corn", type: .turtle)
    ]
    ),
        Question(
            text: "What activities do you enjoy?",
            type: .multiple,
            answer: [
            Answers(text: "Being around others", type: .lion),
            Answers(text: "Self-Reflection", type: .cat),
            Answers(text: "Cuddling up in a blanket", type: .rabbit),
            Answers(text: "Learning new things", type: .turtle)
    ]
    ),
        Question(
            text: <#T##String?#>,
            type: <#T##responseType#>,
            answer: <#T##[Answers]#>)
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
