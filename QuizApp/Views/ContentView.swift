//
//  ContentView.swift
//  QuizApp
//
//  Created by Nordo on 4/6/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm: QuizEngineVM
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.red,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    TimerCountdown()
                    
                    ReusableText(text: "Question \(vm.currentQuestion()) of \(vm.totalQuestions())", size:20)

                    ReusableText(text: vm.model.quizModel.question, size: 25)
                    
                    Image(vm.model.quizModel.questionImage)
                        .resizable()
                        .scaledToFit()
                    
                    ChoiceGridView(vm: vm)
                }
            }
            .navigationTitle("Wild Turkey Quiz")
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: QuizEngineVM())
    }
}
