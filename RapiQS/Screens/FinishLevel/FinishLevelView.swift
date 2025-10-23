import SwiftUI

struct FinishLevelView: View {
    @State var points: Int
    @Binding var levelNumber: Int
    @State private var goToGameMap = false
    @State private var showContent = false
 
    
    init(points: Int, levelNumber: Binding<Int>) {
        _points = State(initialValue: points)
        _levelNumber = levelNumber
        
    }
    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: points == 0 ?
                        [.red.opacity(0.3), .black] :
                        [.yellow.opacity(0.3), .orange.opacity(0.2), .black],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
 
                
                Group {
                    if points == 0 {
                        VStack(spacing: 25) {
                            Text("💀")
                                .font(.system(size: 80))
                            
                            Text("RIP")
                                .font(.system(size: 44, weight: .heavy, design: .monospaced))
                                .font(.title)
                                .foregroundColor(.red)
                            
                            Text("u got 0 points lol")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(.gray)
                            
                            Button {
                                goToGameMap = true
                            } label: {
                                Text("Go Back")
                                    .font(.headline)
                                   .frame(width: 200, height: 55)
                                   .background(
                                       Capsule()
                                           .fill(
                                               LinearGradient(
                                                colors: [.black.opacity(0.4), .black],
                                                   startPoint: .leading,
                                                   endPoint: .trailing
                                               )
                                           )
                                           .shadow(color: .white.opacity(0.3), radius: 1)
                                   )
                                   .foregroundColor(.white)
                            }
                            .padding(.top, 10)
                        }
                    } else {
                        VStack(spacing: 30) {
                            Image(systemName: "crown.fill")
                                .font(.system(size: 100))
                                .foregroundStyle(LinearGradient(colors: [.yellowTrophy, .orangeTrophy], startPoint: .topLeading, endPoint: .bottomTrailing))
 
                            Text("GG")
                                .font(.system(size: 56, weight: .bold))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.yellow, .orange],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                            
                            HStack(spacing: 8) {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                Text("\(points) Points")
                                    .font(.title)
                                    .bold()
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(
                                Capsule()
                                    .fill(.ultraThinMaterial)
                                    .shadow(radius: 10)
                            )
                            
                            Button {
                                LevelServiceClass.UnlockNextLevel(levelNumber + 1, points)
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    goToGameMap = true
                                }
                            } label: {
                                     Text("Continue")
                                 .font(.headline)
                                .frame(width: 200, height: 55)
                                .background(
                                    Capsule()
                                        .fill(
                                            LinearGradient(
                                                colors: [.yellow, .orange],
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .shadow(color: .yellow.opacity(0.5), radius: 15)
                                )
                                .foregroundColor(.black)
                            }
                            .padding(.top, 20)
                        }
                    }
                }
                .scaleEffect(showContent ? 1 : 0.5)
                .opacity(showContent ? 1 : 0)
            }
            .navigationDestination(isPresented: $goToGameMap) {
                GameMap()
                    .navigationBarBackButtonHidden(true)
                    .interactiveDismissDisabled(true)
            }
            .onAppear {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                    showContent = true
                }
                
            }.onChange(of: points) {
                print(points)
            }
        }
    }
}

 

#Preview {
    FinishLevelView(points: 0, levelNumber: .constant(0))
}

