//
//  FinishLevelView.swift
//  RapiQS
//
//  Created by DODJE on 22/10/2025.
//

import SwiftUI

struct FinishLevelView: View {
    @Binding var points: Int
    var body: some View {
        Text("\(points)")
    }
}

#Preview {
    FinishLevelView(points: .constant(20))
}
