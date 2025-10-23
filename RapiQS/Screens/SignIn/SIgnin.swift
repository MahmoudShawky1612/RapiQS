//
//  SIgnin.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//



import SwiftUI
import PhotosUI

struct SIgnin: View {
    @State private var avatarImage: UIImage?
    @State private var photoPickerItem: PhotosPickerItem?
    @StateObject private var signInViewModel = SignInViewModel()
    var body: some View {
        NavigationView {
            
            ZStack {
                LinearGradient(
                    colors: [.backSignOne, .backSignTwo],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                
                VStack(alignment: .center, spacing: 30) {
                    VStack(spacing: 8) {
                        Text("hey there!")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(Color.brownPrimary)
                        
                        Text("let's get you set up")
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }.padding()
                    Spacer().frame(height: 70)
                    PhotosPicker( selection: $photoPickerItem, matching: .images){
                        AvatarImage(avatarImage: avatarImage)
                        
                    }.padding().overlay(
                        Button(action: {
                            if(avatarImage != nil){
                                photoPickerItem = nil
                                avatarImage = nil
                            }
                        }) {
                            Image(systemName:avatarImage == nil ? "camera.fill" : "xmark.circle.fill")
                                .font(.title)
                                .foregroundStyle(Color.brownPrimary)
                                .shadow(color:Color.brownPrimary,radius: 5, x: 0, y: 2)
                            
                        },
                        alignment: .topTrailing
                    )
                    
                    MainTextfield(placeholder: "What you wanna us to call you?", username: $signInViewModel.user.userName)
                    Spacer().frame(height: 50)
                    MainButton(action: { signInViewModel.saveUser() }, title: "Lezz Gooooo", isLoading: signInViewModel.isLoading)
                    Spacer()
                }.onChange(of: photoPickerItem){_,_ in
                    Task{
                        if let photoPickerItem,
                           let data = try? await photoPickerItem.loadTransferable(type: Data.self){
                            if let image = UIImage(data: data){
                                avatarImage = image
                                signInViewModel.user.userImage = data
                                
                            }
                            
                        }
                        photoPickerItem = nil
                        
                        
                    }
                    
                }
                
                
            }.alert(item : $signInViewModel.alertItem ){ alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    SIgnin()
}



