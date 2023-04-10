//
//  ReusableText.swift
//  QuizApp
//
//  Created by Nordo on 4/10/23.
//

import SwiftUI

struct ReusableText: View {
    var text: String
    var size: CGFloat
    
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: .bold, design: .rounded))
            .foregroundColor(.black)
    }
}

struct ReusableText_Previews: PreviewProvider {
    static var previews: some View {
        ReusableText(text: "test string", size: 50)
    }
}
