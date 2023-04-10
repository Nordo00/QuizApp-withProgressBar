//
//  QuizModel.swift
//  QuizApp
//
//  Created by Nordo on 4/6/23.
//

import Foundation
import SwiftUI

struct Quiz {
    var currentQuestionIndex: Int
    var quizModel: QuizModel
    //var totalScore: Int = 0
}

struct QuizModel {
    var question: String
    var questionImage: String
    var choiceList: [QuizChoice]
}


struct QuizChoice: Identifiable {
    var id = UUID()
    var systemImage: String //square, diamond, etc.
    var bgColor: Color //red, orange, etc.
    var choiceText: String
    var isCorrect: Bool = false
}

