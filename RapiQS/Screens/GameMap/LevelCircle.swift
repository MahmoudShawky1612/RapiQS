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

             Text("\(levelNumber)")
                .frame(width: 50, height: 50)
                .background(.red)
                .clipShape(.circle)
                .padding()
                .overlay(unlocked ? nil :  Image(systemName: "lock").font(.system(size: 20)).background(Color.blue))
      }
}

#Preview {
    LevelCircle()
}
