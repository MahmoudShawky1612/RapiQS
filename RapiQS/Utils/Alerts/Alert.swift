//
//  Alert.swift
//  Appetizer
//
//  Created by DODJE on 13/10/2025.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}


struct AlertContext {

    
    static let failedToSaveData     = AlertItem(
                                        title: Text("Failed To Save Data"),
                                        message: Text("Failed to persist or retrive data."),
                                        dismissButton: .default(Text("OK"))
    );
    
    static let invalidUserName     = AlertItem(
                                        title: Text("Failed To Save Data"),
                                        message: Text("Make sure user name is inserted."),
                                        dismissButton: .default(Text("OK"))
                                        
                                        
    );
    
    static let invalidUerImage     = AlertItem(
                                        title: Text("Failed To Save Data"),
                                        message: Text("Make sure user image is inserted."),
                                        dismissButton: .default(Text("OK"))
    );
    
    static let successLogIn     = AlertItem(
                                        title: Text("Yaaay, You made it"),
                                        message: Text("We're glad ro have you with us."),
                                        dismissButton: .default(Text("OK"))
    );
    


}


