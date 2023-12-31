//
//  HomeView.swift
//  Restart
//
//  Created by Y K on 20.12.2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            //MARK: - Header
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 35 : -35)
                .animation(Animation
                    .easeInOut(duration: 4)
                    .repeatForever()
                    , value: isAnimating)
            }
            //MARK: - Center
            Text("The time that leads to mastery is dependent on the instensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            //MARK: - Footer
            
            Spacer()

            
            Button {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            } // Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } // VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                isAnimating = true
            })
        })
    }
}

#Preview {
    HomeView()
}
