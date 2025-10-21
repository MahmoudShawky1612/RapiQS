import SwiftUI

@main
struct RapiQSApp: App {
    @AppStorage("user") private var userData: Data?
    
    var body: some Scene {
        WindowGroup {
            if let _ = userData {
                GameMap() 
            } else {
                SIgnin()
            }
        }
    }
}
