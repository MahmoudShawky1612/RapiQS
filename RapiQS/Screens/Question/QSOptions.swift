//
//  QSOptions.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import SwiftUI

struct QSOptions: View {
    @Binding var i: Int
    var level: Level
    var body: some View {
        VStack(alignment: .center) {
             Text(level.questions[i].title)
                .frame(maxWidth: .infinity, minHeight: 150)
                .font(.headline)
                .foregroundColor(.primary)
                .background(Color.yellow)
                .cornerRadius(10)
                .padding()
            
            VStack {
                HStack{
                    Text(level.questions[i].options[0].String)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .padding()
                    
                    Text(level.questions[i].options[1].String)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .padding()
                }
                HStack{
                    Text(level.questions[i].options[2].String)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .padding()
                    Text(level.questions[i].options[3].String)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .padding()
                }
               
            }
         }.padding()
    }
}

