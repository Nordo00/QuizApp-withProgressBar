//
//  QuizEngineVM.swift
//  QuizApp
//
//  Created by Nordo on 4/7/23.
//

import Foundation
import SwiftUI

class QuizEngineVM: ObservableObject {
    static var currentQuestion = 0
    static var numberCorrect = 0
    
    static func createQuizEngine(i: Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = QuizEngineVM.createQuizEngine(i: QuizEngineVM.currentQuestion)
    
    // This is for the timer
    var timer = Timer()
    @Published var score = 1000 // score per question
    var totalScore = 0 //keeps track of the total score
    
    func startTimer() {
        self.score = 1000
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { time in
            if self.score > 0 {
                self.score -= 10
                print("Your current score is \(self.score)")
            } else {
                print("Timer done")
                self.timer.invalidate()
            }
        })
    }
    
    func resetQuiz() {
        self.timer.invalidate()
        // current question is 0
        QuizEngineVM.currentQuestion = 0
        QuizEngineVM.numberCorrect = 0
        totalScore = 0
        
    }
    
    func invalidateTimer() {
        self.timer.invalidate()
    }
    
    func gotItCorrect() { // increment the number correct
        self.timer.invalidate()
        QuizEngineVM.numberCorrect += 1
        print("Your total number correct is \(QuizEngineVM.numberCorrect)")
        totalScore = totalScore + self.score
        print("Your total score is \(totalScore)")
    }
    
    func howManyCorrect() -> Int { // returns the number correct
        return QuizEngineVM.numberCorrect
    }
    
    func nextQuestion() {
        self.timer.invalidate()
        // add to advance to next question
        // add some logic to make sure we don't go over
        QuizEngineVM.currentQuestion += 1
        
        if QuizEngineVM.currentQuestion < QuizEngineVM.quizData.count {
            self.model = QuizEngineVM.createQuizEngine(i: QuizEngineVM.currentQuestion)
        } else {
            print ("No more question")
        }
            
    }
    
    func currentQuestion() -> Int {
        return QuizEngineVM.currentQuestion + 1
    }
    
    func totalQuestions() -> Int {
        return QuizEngineVM.quizData.count
    }
    
    func allDone () -> Bool {
        if currentQuestion() == totalQuestions() {
            return true
        } else {
            // if at last question then all done
            return false
        }
    }
    
}

//MARK: - Extension
extension QuizEngineVM {

    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Wild turkeys live in every U.S. State except:",
                      questionImage: "turkey",
                      choiceList: [
                        QuizChoice(systemImage: "square.fill", bgColor: .red, choiceText: "Florida"),
                        QuizChoice(systemImage: "diamond.fill", bgColor: .orange, choiceText: "Alaska", isCorrect: true),
                        QuizChoice(systemImage: "triangle.fill", bgColor: .blue, choiceText: "Hawaii"),
                        QuizChoice(systemImage: "circle.fill", bgColor: .green, choiceText: "Texas")
                      ]),
            
            QuizModel(question: "What is a male turkey called:",
                      questionImage: "three_turkeys",
                      choiceList: [
                        QuizChoice(systemImage: "square.fill", bgColor: .red, choiceText: "Rooster"),
                        QuizChoice(systemImage: "diamond.fill", bgColor: .orange, choiceText: "Fred"),
                        QuizChoice(systemImage: "triangle.fill", bgColor: .blue, choiceText: "Tom", isCorrect: true),
                        QuizChoice(systemImage: "circle.fill", bgColor: .green, choiceText: "Gander")
                      ])
        ]
    }
    
}
