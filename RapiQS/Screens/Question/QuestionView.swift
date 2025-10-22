//
//  QuestionView.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import SwiftUI

struct QuestionView: View {
    @State var i  : Int = 0
    var level: Level
    @State var finished = false
    @State var points: Int = 0
    var body: some View {
        VStack{
            QSOptions(i: $i, finished: $finished, points: $points,level: level, )
            Spacer().frame(height: 80)
            HStack{
                Spacer()
                
            }.fullScreenCover(isPresented: $finished){
                FinishLevelView(points: $points)
            }.navigationBarBackButtonHidden(true)
                .interactiveDismissDisabled(true)
            
        }
    }
}






#Preview {
    QuestionView(level: Level(
        id: 1,
        number: 1,
        questions: [
            Question(
                id: 1,
                title: "What is the capital of France?",
                options: [
                    Option(id: 1, String: "Paris"),
                    Option(id: 2, String: "London"),
                    Option(id: 3, String: "Rome"),
                    Option(id: 4, String: "Berlin")
                ],
                time: 15,
                correctAnswer: 1,
                QuestionDifficulty: .easy,
                points: 5
            ),
            Question(
                id: 2,
                title: "Which planet is known as the Red Planet?",
                options: [
                    Option(id: 1, String: "Earth"),
                    Option(id: 2, String: "Mars"),
                    Option(id: 3, String: "Venus"),
                    Option(id: 4, String: "Jupiter")
                ],
                time: 15,
                correctAnswer: 2,
                QuestionDifficulty: .easy,
                points: 5
            ),
            Question(
                id: 3,
                title: "What is the smallest prime number?",
                options: [
                    Option(id: 1, String: "0"),
                    Option(id: 2, String: "1"),
                    Option(id: 3, String: "2"),
                    Option(id: 4, String: "3")
                ],
                time: 10,
                correctAnswer: 3,
                QuestionDifficulty: .easy,
                points: 5
            )
        ]
    ),)
}
