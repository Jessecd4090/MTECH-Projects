//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Jestin Dorius on 2/10/25.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet var resultsAnswerLabel: UILabel!
    @IBOutlet var resultsDefinitionLabel: UILabel!
    
    @IBOutlet var resultsSlackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    calculatePersonalityResult()
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
        resultsSlackView.layer.cornerRadius = 25
        resultsSlackView.layer.masksToBounds = true
    }
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in
            counts[answer.type, default: 0] += 1
        }
        
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
//        let attrString = NSAttributedString(string: "You are a ", attributes: [.imageURL: mostCommonAnswer.rawValue])
        
        
//        resultsAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultsAnswerLabel.text = "You are a " + mostCommonAnswer.rawValue
        resultsDefinitionLabel.text = mostCommonAnswer.definition
    }
    
    
    
    init?(coder: NSCoder, responses: [Answers]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var responses: [Answers]

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
