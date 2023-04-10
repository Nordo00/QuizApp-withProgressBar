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
                        Image("turkey")
                            .resizable()
                            .scaledToFit()
                        ReusableText(text: "You got it right", size: 40)
                            
                        // add to the total number correct
                        let _ = vm.gotItCorrect()
                    } else {
                        Image("turkey")
                            .resizable()
                            .scaledToFit()
                        ReusableText(text: "Sorry, better luck next time", size: 40)
                    }
                    
                    if vm.allDone() {
                        ReusableText(text: "Congrats, you are done with the quiz. You got \(vm.howManyCorrect()) questions right.", size: 40)
                    } else {
                        NavigationLink(destination: ContentView(vm: vm).onAppear{ vm.nextQuestion() }) {
                            Text("Next Question")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                                .frame(width: 230, height: 50)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }//Navigate back to the contentview with the next question
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(vm: QuizEngineVM(), isCorrect: true)
    }
}
