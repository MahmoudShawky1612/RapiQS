//
//  RetriveUserData.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import Foundation
import SwiftUI

 
class UserHelperClass: ObservableObject {
    @Published var user = User()

 
    // MARK: - Static function to get user (without creating instance)
    static func getUserData() -> User? {
        guard let userData = UserDefaults.standard.data(forKey: "user") else { return nil }
        do {
            return try JSONDecoder().decode(User.self, from: userData)
        } catch {
            print("❌ Failed to decode user:", error)
            return nil
        }
    }

    // MARK: - Static function to get user image
    static func getUserImage() -> UIImage? {
        guard let user = getUserData() else { return nil }
        
        // Check if image data is empty
        if !user.userImage.isEmpty {
            return UIImage(data: user.userImage)
        } else {
            return nil
        }
    }
    
    static func getUserName() -> String? {
        guard let user = getUserData() else { return nil }
        return user.userName
    }
    
    static func getUserPoints() -> Int? {
        guard let user = getUserData() else { return nil }
        return user.points
    }
 
}

