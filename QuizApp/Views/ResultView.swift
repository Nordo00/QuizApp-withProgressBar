//
//  ResultView.swift
//  QuizApp
//
//  Created by Nordo on 4/10/23.
//

import SwiftUI

struct ResultView: View {
    var vm: QuizEngineVM
    var isCorrect: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.red,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    if isCorrect {
                        Image("happybird")
                            .resizable()
                            .scaledToFit()
                        ReusableText(text: "You got it right", size: 40)
                            
                    } else {
                        Image("sadpenguin")
                            .resizable()
                            .scaledToFit()
                        ReusableText(text: "Sorry, better luck next time", size: 40)
                    }
                    
                    if vm.allDone() {
                        ReusableText(text: "Congrats, you are done with the quiz.", size: 40)
                        ReusableText(text: "You got \(vm.howManyCorrect()) questions right.", size: 20)
                        ReusableText(text: "Your total score is \(vm.totalScore).", size: 20)
                        NavigationLink(destination: ContentView(vm: vm)) {
                            Text("Reset")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .frame(width: 230, height: 50)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }.simultaneousGesture(TapGesture().onEnded{
                            //Navigate back to the contentview with the next question
                            vm.resetQuiz()
                        })
                        
                    } else {
                        NavigationLink(destination: ContentView(vm: vm)) {
                            Text("Next Question")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .frame(width: 230, height: 50)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }.simultaneousGesture(TapGesture().onEnded{
                            //Navigate back to the contentview with the next question
                            vm.nextQuestion()
                        })
                        
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(vm: QuizEngineVM(), isCorrect: false)
    }
}
