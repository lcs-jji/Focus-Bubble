//
//  Landing View.swift
//  Focus Bubble
//
//  Created by Xinchen Ji on 2025-05-20.
//

import SwiftUI

struct LandingView: View {
    
    var body: some View {
        TabView {
            
            TimerView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(1)
            
            SoundSettingView()
                .tabItem {
                    Image(systemName: "speaker.wave.3.fill")
                    Text("Sound")
                }
                .tag(2)
            
        }
    }
}


#Preview {
    LandingView()
}
