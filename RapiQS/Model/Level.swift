//
//  Level.swift
//  RapiQS
//
//  Created by DODJE on 21/5/2025.
//

import Foundation


struct Level: Identifiable {
    var id : Int
    var number : Int
    var questions : [Question]
}

struct Question {
    var id : Int
    var title : String
    var options : [Option]
    var time : Double
    var correctAnswer: Int
    var QuestionDifficulty: QuestionDifficulty
    var points: Int
}

struct Option {
    var id : Int
    var String : String
}

enum QuestionDifficulty: String {
    case easy
    case medium
    case hard
}

 

class LevelService {
    static let Levels: [Level] = [
        // 🟢 Level 1 — Easy
        Level(
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
                    time: 7,
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
                    time: 7,
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
                    time: 5,
                    correctAnswer: 3,
                    QuestionDifficulty: .easy,
                    points: 5
                )
            ]
        ),

        // 🟡 Level 2 — Medium
        Level(
            id: 2,
            number: 2,
            questions: [
                Question(
                    id: 1,
                    title: "Which language is used for iOS development?",
                    options: [
                        Option(id: 1, String: "Kotlin"),
                        Option(id: 2, String: "Swift"),
                        Option(id: 3, String: "Java"),
                        Option(id: 4, String: "Dart")
                    ],
                    time: 12,
                    correctAnswer: 2,
                    QuestionDifficulty: .medium,
                    points: 5
                ),
                Question(
                    id: 2,
                    title: "In what year did World War II end?",
                    options: [
                        Option(id: 1, String: "1939"),
                        Option(id: 2, String: "1945"),
                        Option(id: 3, String: "1950"),
                        Option(id: 4, String: "1963")
                    ],
                    time: 12,
                    correctAnswer: 2,
                    QuestionDifficulty: .medium,
                    points: 5
                ),
                Question(
                    id: 3,
                    title: "Who painted the Mona Lisa?",
                    options: [
                        Option(id: 1, String: "Leonardo da Vinci"),
                        Option(id: 2, String: "Vincent van Gogh"),
                        Option(id: 3, String: "Pablo Picasso"),
                        Option(id: 4, String: "Michelangelo")
                    ],
                    time: 12,
                    correctAnswer: 1,
                    QuestionDifficulty: .medium,
                    points: 5
                )
            ]
        ),

        // 🔵 Level 3 — Medium
        Level(
            id: 3,
            number: 3,
            questions: [
                Question(
                    id: 1,
                    title: "What is the square root of 256?",
                    options: [
                        Option(id: 1, String: "12"),
                        Option(id: 2, String: "14"),
                        Option(id: 3, String: "7"),
                        Option(id: 4, String: "16")
                    ],
                    time: 7,
                    correctAnswer: 4,
                    QuestionDifficulty: .medium,
                    points: 5
                ),
                Question(
                    id: 2,
                    title: "Which gas do plants absorb during photosynthesis?",
                    options: [
                        Option(id: 1, String: "Oxygen"),
                        Option(id: 2, String: "Nitrogen"),
                        Option(id: 3, String: "Carbon Dioxide"),
                        Option(id: 4, String: "Hydrogen")
                    ],
                    time: 7,
                    correctAnswer: 3,
                    QuestionDifficulty: .medium,
                    points: 5
                ),
                Question(
                    id: 3,
                    title: "Who discovered gravity?",
                    options: [
                        Option(id: 1, String: "Albert Einstein"),
                        Option(id: 2, String: "Isaac Newton"),
                        Option(id: 3, String: "Galileo Galilei"),
                        Option(id: 4, String: "Stephen Hawking")
                    ],
                    time: 7,
                    correctAnswer: 2,
                    QuestionDifficulty: .medium,
                    points: 5
                )
            ]
        ),

        // 🔴 Level 4 — Hard
        Level(
            id: 4,
            number: 4,
            questions: [
                Question(
                    id: 1,
                    title: "What is the chemical symbol for gold?",
                    options: [
                        Option(id: 1, String: "Au"),
                        Option(id: 2, String: "Ag"),
                        Option(id: 3, String: "Gd"),
                        Option(id: 4, String: "Go")
                    ],
                    time: 25,
                    correctAnswer: 1,
                    QuestionDifficulty: .hard,
                    points: 12
                ),
                Question(
                    id: 2,
                    title: "Which is the largest internal organ in the human body?",
                    options: [
                        Option(id: 1, String: "Heart"),
                        Option(id: 2, String: "Lungs"),
                        Option(id: 3, String: "Liver"),
                        Option(id: 4, String: "Kidney")
                    ],
                    time: 25,
                    correctAnswer: 3,
                    QuestionDifficulty: .hard,
                    points: 12
                ),
                Question(
                    id: 3,
                    title: "Who proposed the laws of motion?",
                    options: [
                        Option(id: 1, String: "Galileo"),
                        Option(id: 2, String: "Einstein"),
                        Option(id: 3, String: "Newton"),
                        Option(id: 4, String: "Kepler")
                    ],
                    time: 25,
                    correctAnswer: 3,
                    QuestionDifficulty: .hard,
                    points: 12
                )
            ]
        ),

        // 🔴 Level 5 — Hard
        Level(
            id: 5,
            number: 5,
            questions: [
                Question(
                    id: 1,
                    title: "Which planet has the most moons?",
                    options: [
                        Option(id: 1, String: "Jupiter"),
                        Option(id: 2, String: "Saturn"),
                        Option(id: 3, String: "Neptune"),
                        Option(id: 4, String: "Uranus")
                    ],
                    time: 25,
                    correctAnswer: 2,
                    QuestionDifficulty: .hard,
                    points: 12
                ),
                Question(
                    id: 2,
                    title: "Who developed the C programming language?",
                    options: [
                        Option(id: 1, String: "James Gosling"),
                        Option(id: 2, String: "Dennis Ritchie"),
                        Option(id: 3, String: "Bjarne Stroustrup"),
                        Option(id: 4, String: "Guido van Rossum")
                    ],
                    time: 25,
                    correctAnswer: 2,
                    QuestionDifficulty: .hard,
                    points: 12
                ),
                Question(
                    id: 3,
                    title: "Which country hosted the first modern Olympics?",
                    options: [
                        Option(id: 1, String: "France"),
                        Option(id: 2, String: "USA"),
                        Option(id: 3, String: "Greece"),
                        Option(id: 4, String: "Italy")
                    ],
                    time: 25,
                    correctAnswer: 3,
                    QuestionDifficulty: .hard,
                    points: 12
                )
            ]
        )
    ]

}
