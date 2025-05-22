//
//  Timer View.swift
//  Focus Bubble
//
//  Created by Xinchen Ji on 2025-05-15.
//

import SwiftUI
import AVFoundation

struct TimerView: View {
    
    @State var timeRemaining = 25 * 60
    @State var isRunning = false
    @State var currentPhase = 1
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        NavigationStack {
        
            ZStack {
                
                Group {
                    if currentPhase == 1 {
                        LinearGradient(colors: [
                            Color("LightBlue"), Color("LightBlue"), Color("Brown"), Color("Pink")], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    } else if currentPhase == 2 {
                        LinearGradient(colors: [
                            Color("LightBlue"), Color("LightBlue"), Color("Brown"), Color("Pink")], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    }
                
                VStack(spacing: 40) {
                    
                    Text(formatTime(timeRemaining))
                        .font(.system(size: 60, weight: .bold))
                        .onReceive(timer) { _ in
                            if isRunning && timeRemaining > 0 {
                                timeRemaining -= 1
                            }//ChatGPT
                        }
                    
                    Button(action: {
                        isRunning.toggle() })
                    {
                        Text(isRunning ? "Pause" : "Start")
                            .font(.title2)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }
                .frame(width: 270,height: 270)
                .padding()
                .background(Color(.white).opacity(0.25))
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 10)
                )
            }
            .navigationTitle("Focus Bubble")
        }
    }
}

func formatTime(_ seconds: Int) -> String {
    let mins = seconds / 60
    let secs = seconds % 60
    return String(format: "%02d:%02d", mins, secs)//ChatGPT
}


#Preview {
    TimerView()
}
