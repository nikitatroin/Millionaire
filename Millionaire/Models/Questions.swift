//
//  Questions.swift
//  Millionaire
//
//  Created by Никита Троян on 29.12.2021.
//

import Foundation

struct Question {
    let question: [String:[String]]
}

struct Questions {
    var questions: [Question] = []
    
    mutating func addQuestion(_ question: Question){
        self.questions.append(question)
    }
}


let firstQuestion = Question(question: ["Who first in the Moon?":
                                            ["I",
                                             "He",
                                             "She",
                                             "They"]]
)

let secondQuestion = Question(question: ["Who first in the Mars?":
                                            ["USA",
                                             "Russia",
                                             "Brazil",
                                             "England"]]
)

enum AllQuestions: String {
    case first = "Who first in the Moon?"
    case second = "Who first in the Mars?"
}
