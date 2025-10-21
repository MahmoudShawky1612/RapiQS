//
//  UserInfoHeader.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import SwiftUI

struct UserInfoHeader: View {
    var userImage = UserHelperClass.getUserImage()
    var userName = UserHelperClass.getUserName()
    var userPoints = UserHelperClass.getUserPoints()
    var body: some View {
        HStack{
            HStack {
                AvatarImage(avatarImage: userImage, width: 50, height: 50)
                Text( userName ?? "Guest")
                    .padding()
            } .background(Color.red)
                .cornerRadius(25)
                .padding()
            Spacer()
            HStack{
                Image(systemName: "trophy.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .onTapGesture {
                 if let appDomain = Bundle.main.bundleIdentifier {
                 UserDefaults.standard.removePersistentDomain(forName: appDomain)
                 }
                 
                 }
                Text("+\(String(describing: userPoints ?? 0))")
                    .padding()
                
            }.background(Color.blue)
                .cornerRadius(25)
                .padding()
            
        }
    }
}

#Preview {
    UserInfoHeader()
}
