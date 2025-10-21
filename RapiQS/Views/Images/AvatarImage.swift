//
//  AvatarImage.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import SwiftUI

struct AvatarImage: View {
    let avatarImage: UIImage?
    var width : CGFloat = 100
    var height : CGFloat = 100

    var body: some View {
        Image(uiImage: avatarImage ?? UIImage(resource: .deafaultAvatar))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .clipShape(.circle)
            .shadow(color:Color.brownPrimary,radius: 5, x: 0, y: 2)
        
    }
    }


