//
//  FilterView.swift
//  boredApp
//
//  Created by Amanda Tavares on 17/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import SwiftUI

struct FilterView : View {
    var service: Service
    @State var stepperValue:Int = 1
    @State var accessibilityRange: Double = 0
    @State var priceRange: Double = 0
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Price range")
                    Spacer()
                    Text("\(priceRange)")
                }
                Slider(value: $priceRange, from: 0, through: 1, by: 0.1).accentColor(Color(UIColor: UIColor.systemPurple))
                
            }.padding()

            VStack {
                HStack {
                    Text("Accessibility range")
                    Spacer()
                    Text("\(accessibilityRange)")
                }
                Slider(value: $accessibilityRange, from: 0, through: 1, by: 0.01).accentColor(Color(UIColor: UIColor.systemPurple))
            }.padding()
            
            VStack(alignment: .leading) {
                Stepper(value: $stepperValue, in: 1...10) {
                    Text("Participants: \(stepperValue)")
                }
            }.padding()
            
            Button(action: {
                print("test")
            }) {
                Text("Filter activities")
                    .padding()
                    .foregroundColor(Color(UIColor: UIColor.white))
                    .background(Color(UIColor: UIColor.systemPurple))
                    .cornerRadius(Length(5))
            }
        }.padding(.top, -150)
    }
}

#if DEBUG
struct FilterView_Previews : PreviewProvider {
    static var previews: some View {
        FilterView(service: Service())
    }
}
#endif
