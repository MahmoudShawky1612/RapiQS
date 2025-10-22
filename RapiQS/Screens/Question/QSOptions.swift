//
//  QSOptions.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import SwiftUI

struct QSOptions: View {
    @StateObject var viewModel: QSOptionsViewModel
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 90)
            HStack {
                Image(systemName: "clock.fill")
                    .foregroundColor(viewModel.timeColor)
                Text("\(Int(viewModel.remainingTime))s")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(viewModel.timeColor)
            }
            .frame(width: 200, height: 50)
            .background(
                Capsule()
                    .fill(Color(.systemBackground))
                    .shadow(color: viewModel.timeColor, radius: 8, x: 0, y: 4)
            )
            Spacer().frame(height: 90)
            
            Text(viewModel.level.questions[viewModel.qsNumber].title)
                .frame(maxWidth: .infinity, minHeight: 150)
                .font(.headline)
                .foregroundColor(.primary)
                .background(LinearGradient(colors: [Color(.systemBackground), Color(.systemBackground).opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(10)
                .shadow(color: viewModel.timeColor ,radius: 5, x:0, y:2)
                .multilineTextAlignment(.center)
                .padding()
            
            VStack {
                ForEach(0..<2) { row in
                    HStack {
                        ForEach(0..<2) { col in
                            let index = row * 2 + col
                            Text(viewModel.level.questions[viewModel.qsNumber].options[index].String)
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .font(.headline)
                                .foregroundColor(.primary)
                                .background(viewModel.buttonBackgroundColor)
                                .cornerRadius(10)
                                .multilineTextAlignment(.center)
                                .padding()
                                .onTapGesture {
                                    let optionId = viewModel.level.questions[viewModel.qsNumber].options[index].id
                                    viewModel.checkIfCorrectAnswer(optionId: optionId)
                                }
                                .shadow(color: viewModel.timeColor,radius: 5, x:0, y:2)
                        }
                    }
                }
                Spacer()
            }
        }
        .padding()
        .onAppear {
            viewModel.startGame()
        }
        .onDisappear {
            viewModel.stopTimer()
        }
        .onChange(of: viewModel.remainingTime){
            viewModel.changeTimeColor()
        }
        
    }
    
}

#Preview {
    QSOptions(viewModel: QSOptionsViewModel(qsNumber: 0, finished: false, points: 20, level: Level(
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
    )))
}
