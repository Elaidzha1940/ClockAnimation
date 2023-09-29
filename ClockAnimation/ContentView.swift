//  /*
//
//  Project: ClockAnimation
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 27.09.2023
//
//  */

import SwiftUI

struct SecondsHand: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY - rect.height * 0.21))
        return path
    }
}

struct MinutesHand: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY - rect.height * 0.15))
        return path
    }
}

struct HourHand: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY - rect.height * 0.18))
        return path
    }
}

struct ContentView: View {
    @State var angleRotationSeconds = 0
    @State var angleRotationMinutes = 40
    @State var angleRotationHour = -50
    
    @State var seconds = 1.0
    @State var minutes = 60.0
    @State var hour = 360.0
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(style:
                            StrokeStyle(lineWidth: 10))
                .foregroundColor(.white)
                .padding()
            
            HourHand()
                .stroke(style:
                            StrokeStyle(lineWidth: 10))
                .foregroundColor(.white)
                .rotationEffect(.init(degrees: Double(angleRotationHour)))
            
            
            MinutesHand()
                .stroke(style:
                            StrokeStyle(lineWidth: 10))
                .foregroundColor(.white)
                .rotationEffect(.init(degrees: Double(angleRotationMinutes)))
            
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
            
            Timer.scheduledTimer(withTimeInterval: minutes, repeats: true) { timer in
                angleRotationMinutes += 1
            }
            
            Timer.scheduledTimer(withTimeInterval: hour, repeats: true) { timer in
                angleRotationHour += 1
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
