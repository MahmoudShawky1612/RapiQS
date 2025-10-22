//
//  GameMap.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import SwiftUI

struct GameMap: View {
    let levels = LevelService.Levels
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading, ) {
                ScrollView {
                    
                    ForEach(levels.reversed()){ level in
                        NavigationLink(destination: QuestionView(level: level)
                            .navigationBarBackButtonHidden(true)
                            .interactiveDismissDisabled(true)
                                       
                        )
                        {
                            LevelCircle(levelNumber: level.number)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .rotationEffect(.degrees(180))
                    
                }
                .rotationEffect(.degrees(180))
                
                UserInfoHeader()
                
            }
        }

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
