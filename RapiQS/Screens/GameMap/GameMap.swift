//
//  GameMap.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import SwiftUI

struct GameMap: View {
    let levels = LevelService.Levels
    @State private var showLevels = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                // Background
                LinearGradient(
                    colors: [
                        Color(red: 0.1, green: 0.15, blue: 0.25),
                        Color(red: 0.15, green: 0.1, blue: 0.2)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 25) {
                        Spacer().frame(height: 100)
                        
                        ForEach(Array(levels.reversed().enumerated()), id: \.element.id) { index, level in
                            let unlocked = LevelServiceClass.getPassedLevels().contains(level.number)
                            let delay = Double(index) * 0.08
                            let position = index % 3
                            
                            HStack {
                                if position == 2 {
                                    Spacer()
                                }
                                
                                if unlocked {
                                    NavigationLink(
                                        destination: QuestionView(level: level)
                                            .navigationBarBackButtonHidden(true)
                                            .interactiveDismissDisabled(true)
                                    ) {
                                        LevelCircle(levelNumber: level.number)
                                            .shadow(color: .yellow.opacity(0.3), radius: 10)
                                    }
                                } else {
                                    LevelCircle(levelNumber: level.number)
                                        .grayscale(0.8)
                                        .opacity(0.5)
                                }
                                
                                if position == 1 {
                                    Spacer()
                                }
                            }
                            .padding(.leading, position == 1 ? 40 : 0)
                            .padding(.trailing, position == 2 ? 40 : 0)
                            .opacity(showLevels ? 1 : 0)
                            .offset(x: showLevels ? 0 : (position == 1 ? -50 : position == 2 ? 50 : 0))
                            .animation(
                                .spring(response: 0.6, dampingFraction: 0.7)
                                .delay(delay),
                                value: showLevels
                            )
                            
                            if index < levels.count - 1 {
                                PathConnector()
                                    .opacity(showLevels ? 0.3 : 0)
                                    .animation(
                                        .easeOut(duration: 0.4)
                                        .delay(delay + 0.1),
                                        value: showLevels
                                    )
                            }
                        }
                        
                        Spacer().frame(height: 40)
                    }
                    .rotationEffect(.degrees(180))
                }
                .rotationEffect(.degrees(180))
                
                UserInfoHeader()
                    .opacity(showLevels ? 1 : 0)
                    .offset(y: showLevels ? 0 : -20)
                    .animation(
                        .easeOut(duration: 0.5).delay(0.3),
                        value: showLevels
                    )
            }
            .onAppear {
                showLevels = true
            }
        }
    }
}

struct PathConnector: View {
    var body: some View {
        VStack(spacing: 4) {
            ForEach(0..<3, id: \.self) { _ in
                Circle()
                    .fill(Color.white)
                    .frame(width: 4, height: 4)
            }
        }
        .frame(height: 20)
    }
}

#Preview {
    GameMap()
}

/*             .onTapGesture {
 if let appDomain = Bundle.main.bundleIdentifier {
 UserDefaults.standard.removePersistentDomain(forName: appDomain)
 }
 
 }
 */
