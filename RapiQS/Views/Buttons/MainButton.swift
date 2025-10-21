//
//  MainButton.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import SwiftUI

struct MainButton: View {
    let action: () -> Void
    let title: String
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(width: 200, height: 50)
                .font(.headline)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(Color(.systemBackground))
                .background(Color.brownPrimary)
                .cornerRadius(10)
                .shadow(color:Color.brownPrimary,radius: 5, x: 0, y: 2)
            
            
        }
    }
}


