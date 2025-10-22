import SwiftUI

struct FlyingCoinsView: View {
    @Binding var trigger: Bool
    @State private var coins: [CoinData] = []
    
    struct CoinData: Identifiable {
        let id = UUID()
        let angle: Double
    }
    
    var body: some View {
        ZStack {
            ForEach(coins) { coin in
                Image(systemName: "dollarsign.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundStyle(.yellow)
                    .shadow(color: .yellow.opacity(0.4), radius: 5)
                    .modifier(ExplodeEffect(angle: coin.angle))
            }
        }
        .onChange(of: trigger) { _, newValue in
            if newValue {
                coins = (0..<10).map { i in
                    CoinData(angle: (360.0 / 10.0) * Double(i))
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    coins.removeAll()
                }
            }
        }
    }
}

struct ExplodeEffect: ViewModifier {
    let angle: Double
    
    @State private var offset = CGSize.zero
    @State private var opacity: Double = 1.0
    @State private var scale: CGFloat = 1.0
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .offset(offset)
            .opacity(opacity)
            .onAppear {
                let radians = angle * .pi / 180
                let distance: CGFloat = 150
                
                withAnimation(.easeOut(duration: 0.6)) {
                    offset = CGSize(
                        width: cos(radians) * distance,
                        height: sin(radians) * distance
                    )
                    opacity = 0
                    scale = 0.5
                }
            }
    }
}
