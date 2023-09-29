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
    
    struct MinutesHand: Shape {
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: 240))
            return path
        }
    }
    
    struct HoursHand: Shape {
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: 200))
            return path
        }
    }
    
    var body: some View {
        @State var angleRotationSeconds = 0
        @State var seconds = 1.0
        
        ZStack {
            
            Circle()
                .stroke(style:
                            StrokeStyle(lineWidth: 10))
                .foregroundColor(.white)
                .padding()
            
            SecondsHand()
                .stroke(style:
                            StrokeStyle(lineWidth: 10))
                .foregroundColor(.white)
                .rotationEffect(.init(degrees: Double(angleRotationSeconds)))
        }
        .onAppear {
            
            Timer.scheduledTimer(withTimeInterval: seconds, repeats: true) { timer in
                angleRotationSeconds += 1
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
