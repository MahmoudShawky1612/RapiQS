//
//  NextButon.swift
//  RapiQS
//
//  Created by DODJE on 22/10/2025.
//

import SwiftUI

struct NextButon: View {
    var action: () -> Void
    var body: some View {
        Button(action:action
               
        ) {
            Image(systemName: "arrow.right.circle.fill")
                .font(.system(size: 45))
            
            
        }.padding()
    }
}

#Preview {
    NextButon(action: { })
}
