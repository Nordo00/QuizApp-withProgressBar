//
//  TimerCountdown.swift
//  QuizApp
//
//  Created by Nordo on 4/10/23.
//

import SwiftUI

struct TimerCountdown: View {
    @ObservedObject var vm: QuizEngineVM

    var body: some View {
        ProgressView(value: Float(vm.score), total: 1000.0)
    }
}

struct TimerCountdown_Previews: PreviewProvider {
    static var previews: some View {
        TimerCountdown(vm: QuizEngineVM())
    }
}
