//
//  SignInViewModel.swift
//  RapiQS
//
//  Created by DODJE on 21/10/2025.
//

import Foundation
import SwiftUI


class SignInViewModel: ObservableObject {
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
 
    var isValid: Bool {
        guard !user.userName.isEmpty else{
            alertItem = AlertContext.invalidUserName
            return false
        }
        
        guard !user.userImage.isEmpty else{
            alertItem = AlertContext.invalidUerImage
            return false
        }
        
        return true
    }
    func saveUser() {
        isLoading = true
        guard isValid else {
            isLoading = false
            return
        }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.successLogIn
            LevelServiceClass.UnlockNextLevel(1, 0)
            isLoading = false
 
        } catch{
            isLoading = false
            alertItem = AlertContext.failedToSaveData
        }
    }
    
    func loadUser() {
        guard let userData = userData else {return}
        
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.failedToSaveData
        }
    }
}
