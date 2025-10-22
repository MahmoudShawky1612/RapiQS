import SwiftUI

struct FinishLevelView: View {
    @Binding var points: Int
    @Binding var levelNumber: Int
    @State private var goToGameMap = false
    
    var body: some View {
        NavigationStack {
            Group {
                if points == 0 {
                    VStack {
                        Text("Game Over")
                            .font(.title)
                            .foregroundColor(.red)
                        Text("You Lose")
                            .font(.headline)
                    }
                } else {
                    VStack(spacing: 20) {
                        Text("GG")
                            .font(.title)
                            .foregroundColor(.red)
                        Text("You Win")
                            .font(.headline)
                        
                        Button {
                            LevelServiceClass.UnlockNextLevel(levelNumber + 1, points)
                            
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                goToGameMap = true
                            }
                            
                        } label: {
                            Text("Next")
                                .frame(width: 150, height: 50)
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                        }
                        .navigationDestination(isPresented: $goToGameMap) {
                            GameMap()
                                .navigationBarBackButtonHidden(true)
                                .interactiveDismissDisabled(true)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FinishLevelView(points: .constant(10), levelNumber: .constant(0))
}
