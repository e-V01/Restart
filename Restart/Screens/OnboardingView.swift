//
//  OnboardingView.swift
//  Restart
//
//  Created by Y K on 20.12.2023.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        VStack {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button {
                isOnboardingViewActive = false
            } label: {
                Text("Start")
            }
        }// VSTACK
    }
}

#Preview {
    OnboardingView()
}
