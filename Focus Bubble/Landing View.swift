//
//  Landing View.swift
//  Focus Bubble
//
//  Created by Xinchen Ji on 2025-05-20.
//

import SwiftUI

struct LandingView: View {
    
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(colors: [
                    Color("LightBlue"), Color("LightBlue"), Color("Brown"), Color("Pink")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    TimerView()
                }
                .navigationTitle("Focus Bubble")
            }
        }
    }
}

#Preview {
    LandingView()
}
