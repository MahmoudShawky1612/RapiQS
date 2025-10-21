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
             Text("\(levelNumber)")
                .frame(width: 50, height: 50)
                .background(.red)
                .clipShape(.circle)
                .padding()
     }
}

#Preview {
    LevelCircle()
}
