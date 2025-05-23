//
//  Timer View.swift
//  Focus Bubble
//
//  Created by Xinchen Ji on 2025-05-15.
//

import SwiftUI
import AVFoundation

struct TimerView: View {
    
    let focusTimerAmount = 10
    let shortBreakTimerAmount = 5 * 60
    let longBreakTimerAmount = 15 * 60
    @State var timer: Timer?
    @State var timeRemaining = 10
    @State var isRunning: Bool = false
    @State var currentPhase = 1
    @State var cycleCount = 0
    @State var changeComplete = false
    
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Group {
                    if currentPhase == 1 {
                        LinearGradient(colors: [
                            Color("LightBlue"), Color("PaleBlue"), Color("Brown"), Color("Pink")], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    } else if currentPhase == 2 {
                        LinearGradient(colors: [
                            Color("Grey"), Color("Brown"), Color("PaleBlue"), Color("Pink")], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    } else {
                        LinearGradient(colors: [
                            Color("LightBlue"), Color("Pink"), Color("Brown"), Color("PaleBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
                    }
                }
                
                VStack {
                    
                    VStack(spacing: 40) {
                        
                        Text(formatTime(timeRemaining))
                            .font(.system(size: 60, weight: .bold))
                        
                        HStack {
                            
                            Button("Start") {
                                isRunning.toggle()
                                startTimer()
                            }
                            .font(.title2)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            
                            Button("Stop") {
                                stopTimer()
                            }
                            .font(.title2)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        }
                    }
                    .frame(width: 270,height: 270)
                    .padding()
                    .background(Color(.white).opacity(0.4))
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.gray, lineWidth: 10)
                    )
                    
                    Picker("Timer Type", selection: $currentPhase.animation()) {
                        Text("Focus").tag(1)
                        Text("Short Break").tag(2)
                        Text("Long Break").tag(3)
                    }
                    .pickerStyle(.segmented)
                    .padding(30)
                    
                    Text("Rounds have you done with Focus Bubble: \(cycleCount)")
                        .font(.title2)
                        .padding()
                }
            }
            .navigationTitle("Focus Bubble")
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
        { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                switchPhase()
                stopTimer()
            }
        }
    }
    
    func stopTimer() {
        isRunning = false
        timer?.invalidate()
    }
    
    func switchPhase() {
        if currentPhase == 1 {
            cycleCount += 1
            if cycleCount % 2 == 0{
                currentPhase = 3
                timeRemaining = longBreakTimerAmount
                startTimer()
            } else {
                currentPhase = 2
                timeRemaining = shortBreakTimerAmount
                startTimer()
            }
        } else {
            currentPhase = 1
            timeRemaining = focusTimerAmount
            startTimer()
        }
        isRunning = false
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
