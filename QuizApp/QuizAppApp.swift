//
//  QuizAppApp.swift
//  QuizApp
//
//  Created by Nordo on 4/6/23.
//

import SwiftUI

@main
struct QuizAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: QuizEngineVM())
        }
    }
}
