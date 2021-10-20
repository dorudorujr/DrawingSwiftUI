//
//  DrawPoints.swift
//  Drawing
//
//  Created by RLS77777777 on 2021/10/19.
//

import SwiftUI

struct DrawPoints: Identifiable {
    var points: [CGPoint]
    var color: Color
    var id = UUID()
}

enum DrawColor {
    case red
    case clear
    
    var color: Color {
        switch self {
        case .red:
            return .red
        case .clear:
            return .white
        }
    }
}
