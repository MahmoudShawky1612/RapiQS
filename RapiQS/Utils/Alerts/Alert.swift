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
    


}


