import SwiftUI

struct QuestionView: View {
    @StateObject private var viewModel: QSOptionsViewModel
    @State private var showContent = false
    
    init(level: Level) {
        _viewModel = StateObject(wrappedValue: QSOptionsViewModel(qsNumber: 0, finished: false, points: 0, level: level))
    }
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                 colors: [
                     .backSignOne,
                    .backSignTwo
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header with progress
                VStack(spacing: 12) {
                   
 
                    // Progress bar
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Capsule()
                                .fill(Color.black.opacity(0.1))
                                .frame(height: 6)
                            
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        colors: [.yellow, .orange],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(
                                    width: geometry.size.width * CGFloat(viewModel.qsNumber + 1) / CGFloat(viewModel.level.questions.count),
                                    height: 6
                                )
                                .animation(.spring(response: 0.5), value: viewModel.qsNumber)
                        }
                    }
                    .frame(height: 6)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 10)
                .opacity(showContent ? 1 : 0)
                .offset(y: showContent ? 0 : -20)
                
                // Question content
                QSOptions(viewModel: viewModel)
                    .opacity(showContent ? 1 : 0)
                    .scaleEffect(showContent ? 1 : 0.95)
                
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $viewModel.finished) {
            FinishLevelView(points: viewModel.points, levelNumber: $viewModel.level.number)
        }
        .navigationBarBackButtonHidden(true)
        .interactiveDismissDisabled(true)
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                showContent = true
            }
        }
        .onChange(of: viewModel.qsNumber) { _, _ in
            showContent = false
            withAnimation(.easeOut(duration: 0.4).delay(0.1)) {
                showContent = true
            }
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
    ))
}
