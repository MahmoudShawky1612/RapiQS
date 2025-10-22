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
    
    
    static func addPoints(_ newPoints: Int) {
        let defaults = UserDefaults.standard
        
        guard let userData = defaults.data(forKey: "user"),
              var user = try? JSONDecoder().decode(User.self, from: userData) else {
            print("⚠️ No user found to update points.")
            return
        }
        
        user.points += newPoints
        
        if let updatedData = try? JSONEncoder().encode(user) {
            defaults.set(updatedData, forKey: "user")
            print("✅ Updated points to \(user.points)")
        }
        defaults.synchronize()
    }
    
    
}

