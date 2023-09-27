//  /*
//
//  Project: ClockAnimation
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 27.09.2023
//
//  */

import SwiftUI

struct ContentView: View {
    
    struct SecondsHand: Shape {
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: 250))
            return path
        }
    }
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(style:
                            StrokeStyle(lineWidth: 10))
                .foregroundColor(.white)
                .padding()
            
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
