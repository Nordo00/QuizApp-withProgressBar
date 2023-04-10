//
//  TimerCountdown.swift
//  QuizApp
//
//  Created by Nordo on 4/10/23.
//

import SwiftUI

struct TimerCountdown: View {
    
    @State private var currentScore = 1.0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ProgressView(value: currentScore)
            .onReceive(timer) { _ in 
                if currentScore > 0 {
                    currentScore -= 0.01
                }
            }
    }
}

struct TimerCountdown_Previews: PreviewProvider {
    static var previews: some View {
        TimerCountdown()
    }
}
