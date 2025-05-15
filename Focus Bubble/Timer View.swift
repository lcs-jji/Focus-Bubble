//
//  Timer View.swift
//  Focus Bubble
//
//  Created by Xinchen Ji on 2025-05-15.
//

import SwiftUI
import AVFoundation

struct TimerView: View {
    @State private var timeRemaining = 25 * 60
    @State private var isRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 40) {
            Text(formatTime(timeRemaining))
                .font(.system(size: 60, weight: .bold))
                .onReceive(timer) { _ in
                    if isRunning && timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }

            Button(action: { isRunning.toggle() }) {
                Text(isRunning ? "Pause" : "Start")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
        .padding()
        .background(Color(.systemTeal).opacity(0.1))
    }

    func formatTime(_ seconds: Int) -> String {
        let mins = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", mins, secs)
    }
}

#Preview {
    TimerView()
}
