//
//  MainTextfield.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import SwiftUI

struct MainTextfield: View {
    let placeholder: String
    @Binding var username: String
    var body: some View {
        TextField(placeholder, text: $username)
            .frame(width: 250)
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(8)
            .shadow(color:Color.brownPrimary,radius: 2, x: 0, y: 2)
            .autocorrectionDisabled(true)
            .autocapitalization(.none)
    }
}
 
