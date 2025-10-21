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
            VStack(alignment: .center, spacing: 100) {
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
                
                MainTextfield(placeholder: "Enter your username", username: $signInViewModel.user.userName)
                
                MainButton(action: { signInViewModel.saveUser() }, title: "Start Playing!", isLoading: signInViewModel.isLoading)
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
            
            .navigationTitle(Text("Sign In"))
        }.alert(item : $signInViewModel.alertItem ){ alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    SIgnin()
}



