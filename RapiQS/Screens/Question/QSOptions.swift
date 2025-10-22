//
//  QSOptions.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import SwiftUI

struct QSOptions: View {
    @Binding var i: Int
    @State var buttonBackgroundColor: Color = .yellow
    @Binding var finished: Bool
    @State var timerRunning = false
    @State var remainingTime: TimeInterval = 5
    @State private var timer: Timer? = nil
    @State var optionId: Int?
    @Binding var points: Int
    var level: Level
    
    
    
    var body: some View {
        VStack(alignment: .center) {
            HStack{
                Image(systemName: "clock")
                Text("\(Int(remainingTime))s")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.yellow)
             }
            
            Text(level.questions[i].title)
                .frame(maxWidth: .infinity, minHeight: 150)
                .font(.headline)
                .foregroundColor(.primary)
                .background(Color.yellow)
                .cornerRadius(10)
                .padding()
            
            VStack {
                ForEach(0..<2) { row in
                    HStack {
                        ForEach(0..<2) { col in
                            let index = row * 2 + col
                            Text(level.questions[i].options[index].String)
                                .frame(maxWidth: .infinity)
                                .font(.headline)
                                .foregroundColor(.primary)
                                .background(buttonBackgroundColor)
                                .cornerRadius(10)
                                .padding()
                                .onTapGesture {
                                    optionId = level.questions[i].options[index].id
                                    checkIfCorrectAnswer(optionId: optionId!)
                                }
                        }
                    }
                }
            }
        }.padding()
            .onAppear{
                startGame()
            }
            .onDisappear{
                stopTimer()
            }
    }
    func startGame(){
        stopTimer()
        remainingTime = level.questions[i].time
        timerRunning = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ timer in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                points = 0
                timer.invalidate()
                timerRunning = false
                finished = true
            }
            
        }
    }
    func stopTimer() {
        timerRunning = false
        timer?.invalidate()
    }
    
    func checkIfCorrectAnswer(optionId: Int) {
        if optionId == level.questions[i].correctAnswer {
            points += level.questions[i].points
            print(points)
            
            if i < level.questions.count - 1 {
                i += 1
                buttonBackgroundColor = .yellow
                startGame()
            } else {
                finished = true
                buttonBackgroundColor = .yellow
            }
        } else {
            buttonBackgroundColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                buttonBackgroundColor = .yellow
            }
        }
    }
    
}


