//
//  ShakeModifier.swift
//  RapiQS
//
//  Created by DODJE on 22/10/2025.
//

import Foundation
 import SwiftUI


struct ShakeModifier: GeometryEffect {
    var travelDistance: CGFloat = 10
    var numberOfShakes: CGFloat = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
                                                travelDistance * sin(animatableData * .pi * numberOfShakes), y: 0))
    }
}
