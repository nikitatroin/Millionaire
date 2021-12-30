//
//  GameViewController.swift
//  Millionaire
//
//  Created by Никита Троян on 29.12.2021.
//

import UIKit

final class GameViewController: UIViewController {
    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var second: UILabel!
    @IBOutlet weak var third: UILabel!
    @IBOutlet weak var fourth: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var game: GameSession?
    
    @IBAction func check(_ sender: UIButton) {
        if textField.text == AllAnswers.first.rawValue {
            addScore()
            createSecondQustion()
        } else if textField.text == AllAnswers.second.rawValue{
            addScore()
            UIView.animate(withDuration: 0.5) {
                    self.winner.alpha = 1
            } completion: { _ in
                self.dismiss(animated: true, completion: nil)
                Game.shared.addGame(self.game!)
            }
        } else {
            self.dismiss(animated: true, completion: nil)
            Game.shared.addGame(self.game!)
        }
    }
    
    var questions = Questions()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.game = GameSession(date: Date())
        self.winner.alpha = 0
        questions.addQuestion(firstQuestion)
        questions.addQuestion(secondQuestion)
        createFirstQustion()
        
    }
    
    private func createFirstQustion(){
        self.question.text = AllQuestions.first.rawValue
        self.first.text = questions.questions[0].question[AllQuestions.first.rawValue]![0]
        self.second.text = questions.questions[0].question[AllQuestions.first.rawValue]![1]
        self.third.text = questions.questions[0].question[AllQuestions.first.rawValue]![2]
        self.fourth.text = questions.questions[0].question[AllQuestions.first.rawValue]![3]
    }
    
    private func createSecondQustion(){
        self.question.text = AllQuestions.second.rawValue
        self.first.text = questions.questions[1].question[AllQuestions.second.rawValue]![0]
        self.second.text = questions.questions[1].question[AllQuestions.second.rawValue]![1]
        self.third.text = questions.questions[1].question[AllQuestions.second.rawValue]![2]
        self.fourth.text = questions.questions[1].question[AllQuestions.second.rawValue]![3]
    }    
}

extension GameViewController: GameSessionDelegate {
    func addScore() {
        self.game?.curentScore += 1
    }
}

