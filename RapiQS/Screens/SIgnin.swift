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
    @State private var username: String = ""
    var body: some View {
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
            
            MainTextfield(placeholder: "Enter your username", username: $username)
            
            MainButton(action: { }, title: "Start Playing!")
        }.onChange(of: photoPickerItem){_,_ in
            Task{
                if let photoPickerItem,
                   let data = try? await photoPickerItem.loadTransferable(type: Data.self){
                    if let image = UIImage(data: data){
                        avatarImage = image
                        
                    }
                    
                }
                photoPickerItem = nil
                
                
            }
            
        }
    }
}

#Preview {
    SIgnin()
}
