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
            VStack {
                TimerView()
            }
            .navigationTitle("Focus Bubble")
        }
    }
}

#Preview {
    LandingView()
}
