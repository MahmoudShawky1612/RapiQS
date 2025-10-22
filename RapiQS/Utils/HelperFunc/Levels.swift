//
//  Levels.swift
//  RapiQS
//
//  Created by DODJE on 22/10/2025.
//

import Foundation


class LevelServiceClass {
    
    
    static func UnlockNextLevel(_ level: Int, _ points: Int) {
        let defaults = UserDefaults.standard
        var levels = defaults.array(forKey: "unlockedLevels") as? [Int] ?? []
        if !levels.contains(level) {
                   levels.append(level)
                   defaults.set(levels, forKey: "unlockedLevels")
                    UserHelperClass.addPoints(points)
                    defaults.synchronize()
               }
    }
    
    static func getPassedLevels() -> [Int] {
        let defaults = UserDefaults.standard
        return defaults.array(forKey: "unlockedLevels") as? [Int] ?? []
    }
}
