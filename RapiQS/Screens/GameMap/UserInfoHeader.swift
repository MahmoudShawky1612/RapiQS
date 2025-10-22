//
//  UserInfoHeader.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//
import SwiftUI

struct UserInfoHeader: View {
    @AppStorage("user") private var userData: Data?      // 👈 This is the saved user data
    @State private var user = User()                     // local user model
    
    var body: some View {
        HStack {
            HStack {
                AvatarImage(avatarImage: UIImage(data: user.userImage), width: 50, height: 50)
                    .onTapGesture {
                     if let appDomain = Bundle.main.bundleIdentifier {
                     UserDefaults.standard.removePersistentDomain(forName: appDomain)
                     }
                     
                     }
                Text(user.userName.isEmpty ? "Guest" : user.userName)
                    .padding()
            }
            .background(Color.red)
            .cornerRadius(25)
            .padding()
            
            Spacer()
            
            HStack {
                Image(systemName: "trophy.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
                Text("+\(user.points)")
                    .padding()
            }
            .background(Color.blue)
            .cornerRadius(25)
            .padding()
        }
        // 👇 Automatically decode user data when it changes
        .onChange(of: userData) {
            loadUser()
        }
        .onAppear {
            loadUser()
        }
    }
    
    private func loadUser() {
        guard let userData = userData,
              let decodedUser = try? JSONDecoder().decode(User.self, from: userData) else {
            return
        }
        user = decodedUser
    }
}


#Preview {
    UserInfoHeader()
}
