//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var inputTime: String = ""
    @State var decimalsShown = 1.0
    @State var showTime = true
    @State var timeFormat = false
    var time: Double {
        if let time = Double(inputTime) {
            return time
        }
        else {
            return 10.0
        }
    }
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text("Description")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Text("""
                    The view is a circular clock that continously drains as time passes and shows how much time is left until it finished. The clock can be paused/continued and stopped with the buttons in the view. The number of decimals shown and the time for the clock can be changed below.
                    """)
                
                TextField("Time in Seconds", text: $inputTime)
                Text("Number of Decimals Shown")
                Slider(value: $decimalsShown,
                       in: 0...2,
                       step: 1.0,
                       label: {
                    Text("Number of decimals Shown")
                }, minimumValueLabel: {
                    Text("0")
                }, maximumValueLabel: {
                    Text("2")
                })
                Toggle(isOn: $showTime, label: {Text("Show Time Left")})
                Toggle(isOn: $timeFormat, label: {Text("Show Hours Minutes Seconds")})
            }
            .padding(.bottom)
            
            List {
                NavigationLink(destination: ComposableViewsAndAnimations(totalTime: time, decimalsShown: Int(decimalsShown))) {
                    SimpleListItemView(title: "Simple timer",
                                       caption: "Shows how many seconds are left")
                }
            }
            
        }
        .padding()
        .navigationTitle("My Composable View")
        
    }
}

struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}
