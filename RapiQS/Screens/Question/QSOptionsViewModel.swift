//
//  QSOptionsViewModel.swift
//  RapiQS
//
//  Created by DODJE on 22/10/2025.
//

import Foundation

 import SwiftUI

class QSOptionsViewModel: ObservableObject {
    @Published var qsNumber: Int
    @Published var finished: Bool
    @Published var points: Int
    @Published var remainingTime: Double = 0
    @Published var buttonBackgroundColor: Color = .yellow
    @Published var timerRunning: Bool = false
    @Published var timeColor: Color = .blue

    var timer: Timer?
    @Published var level: Level

    init(qsNumber: Int, finished: Bool, points: Int, level: Level) {
        self.qsNumber = qsNumber
        self.finished = finished
        self.points = points
        self.level = level
    }

    func startGame() {
        stopTimer()
        remainingTime = level.questions[qsNumber].time
        timerRunning = true

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                self.points = 0
                timer.invalidate()
                self.timerRunning = false
                self.finished = true
            }
        }
    }

    func stopTimer() {
        timerRunning = false
        timer?.invalidate()
    }

    func checkIfCorrectAnswer(optionId: Int) {
        if optionId == level.questions[qsNumber].correctAnswer {
            points += level.questions[qsNumber].points
            print("✅ Correct! Points:", points)

            if qsNumber < level.questions.count - 1 {
                qsNumber += 1
                buttonBackgroundColor = .yellow
                startGame()
            } else {
                finished = true
                buttonBackgroundColor = .yellow
            }
        } else {
            buttonBackgroundColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.buttonBackgroundColor = .yellow
            }
        }
    }
    func changeTimeColor() {
        if remainingTime < 5 {
            timeColor = .red
        } else if remainingTime < 10 {
            timeColor = .orange
        } else {
            timeColor = .blue
        }
    }
}
