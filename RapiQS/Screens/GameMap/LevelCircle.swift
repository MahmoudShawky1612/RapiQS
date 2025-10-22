//
//  LevelCircle.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import SwiftUI

struct LevelCircle: View {
    var levelNumber : Int = 0
    var body: some View {
        let unlocked = LevelServiceClass.getPassedLevels().contains(levelNumber)
        
        Group {
            if(unlocked){
                Text("\(levelNumber)")
                    .shadow(color:.black, radius: 4, x:1, y:2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(LinearGradient(colors: [.yellowTrophy, .orangeTrophy], startPoint: .bottomTrailing, endPoint: .top))
                    .clipShape(.circle)
                    .shadow(color:.brownPrimary ,radius: 4, x:1, y:2)
                    .padding()
            }
            else {
                Image(systemName: "lock.fill")
                    .shadow(color:.black.opacity(0.6), radius: 4, x:1, y:2)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(LinearGradient(colors: [.primaryBlue, .primaryGrey], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(.circle)
                    .shadow(color:.primaryBlue ,radius: 5, x:1, y:2)
                    .padding()
                
            }
        }
    }
}

#Preview {
    LevelCircle()
}
