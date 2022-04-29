//
//  ComposableViewsAndAnimations.swift
//  ComposableViewsAndAnimations
//
//  Created by Jacobo de Juan Millon on 2022-04-26.
//

import SwiftUI

struct ComposableViewsAndAnimations: View {
    let totalTime: Double
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State var timePassed = 0.0
    @State var isTimerRunning = false
    @State var timePassedNoAnimation = 0.0
    @State var decimalsShown: Int
    var timeLeftNoAnimation: Double {
        return totalTime - timePassedNoAnimation
    }
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Circle()
                    .trim(from: 0, to: (totalTime - timePassed) / totalTime)
                    .stroke(Color(hue: (totalTime - timePassed) / totalTime / 3,
                                  saturation: 1.0,
                                  brightness: 1.0),
                            lineWidth: 20)
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                    .onReceive(timer) { input in
                        if isTimerRunning {
                            if timePassed < totalTime {
                                withAnimation(.linear(duration: 1)) {
                                    timePassed += 0.01
                                }
                                timePassedNoAnimation += 0.01
                            }
                            else {
                                timePassedNoAnimation = 0.0
                                timePassed = 0.0
                                isTimerRunning = false
                            }
                        }
                    }
                
                Text(String(format: "%.\(decimalsShown)f", timeLeftNoAnimation))
                    .font(.title)
            }
            HStack {
                Spacer()
                Image(systemName: "stop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        timePassedNoAnimation = 0.0
                        timePassed = 0.0
                        isTimerRunning = false
                    }
                Spacer()
                Image(systemName: (isTimerRunning ? "pause.circle" : "play.circle"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        isTimerRunning = !isTimerRunning
                    }
                Spacer()
            }
        }
    }
}
struct ComposableViewsAndAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ComposableViewsAndAnimations(totalTime: 10.0, decimalsShown: 0)
    }
}
