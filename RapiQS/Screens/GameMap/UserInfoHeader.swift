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
                
                Text(user.userName.isEmpty ? "Guest" : user.userName)
                    .foregroundStyle(.white)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .padding()
                    .lineLimit(2)
                
            }
            .background(LinearGradient(colors: [.black, .primaryBlue], startPoint: .bottomLeading, endPoint: .topTrailing))
            .cornerRadius(25)
            .shadow(color:Color.primaryBlue, radius: 5, x: 0, y: 2)
            .padding()
            
            Spacer()
            
            HStack {
                Image(systemName: "trophy.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.orangeTrophy, .yellowTrophy],
                            startPoint: .bottomTrailing,
                            endPoint: .topLeading
                        )
                    )
                    .padding(.leading)
                    .padding(.top,5)
                    .padding(.bottom, 5)
                
                
                Text("+ \(user.points)")
                    . foregroundStyle(.white)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .padding(.trailing,)
                    .padding(.leading)
                    .lineLimit(3)
            }
            .background(
                LinearGradient(colors: [.orangeTrophy, .primaryBrown], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(25)
            .shadow(color:Color.orangeTrophy, radius: 5, x: 0, y: 2)
            .padding()
        }
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
