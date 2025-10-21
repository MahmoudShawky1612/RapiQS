import SwiftUI

struct MainButton: View {
    let action: () -> Void
    let title: String
    var isLoading: Bool = false

    var body: some View {
        Button(action: action) {
            Group {
                if isLoading {
                    ProgressView()
                        .tint(Color(.systemBackground))
                } else {
                    Text(title)
                }
            }
            .frame(width: 200, height: 50)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundColor(Color(.systemBackground))
            .background(Color.brownPrimary)
            .cornerRadius(10)
            .shadow(color: Color.brownPrimary, radius: 5, x: 0, y: 2)
        }
         .disabled(isLoading)
    }
}
