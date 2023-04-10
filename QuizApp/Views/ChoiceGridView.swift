//
//  ChoiceGridView.swift
//  QuizApp
//
//  Created by Nordo on 4/10/23.
//

import SwiftUI

struct ChoiceGridView: View {
    var vm: QuizEngineVM
    
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 0), count: 2)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(vm.model.quizModel.choiceList) { choice in
                
                NavigationLink(destination: ResultView(vm: vm, isCorrect: choice.isCorrect)) {
                    Text("\(Image(systemName: choice.systemImage)) \(choice.choiceText)")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .frame(width: 160, height: 50)
                        .background(choice.bgColor)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
        }
    }
}

struct ChoiceGridView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceGridView(vm: QuizEngineVM())
    }
}
