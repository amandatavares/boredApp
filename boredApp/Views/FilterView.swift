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
    @State var priceRange: Double = 0.0
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Price range")
                    Spacer()
                    Text("\(priceRange)")
                }
                Slider(value: $priceRange, in: 0.0...1.0).accentColor(Color(UIColor: UIColor.systemPurple))
                
//                Slider(value: $priceRange, from: 0.0, through: 1.0, by: 0.1).accentColor(Color(UIColor: UIColor.systemPurple))
            }.padding()

            VStack {
                HStack {
                    Text("Accessibility range")
                    Spacer()
                    Text("\(accessibilityRange)")
                }
                Slider(value: $accessibilityRange, in: 0...1).accentColor(Color(UIColor: UIColor.systemPurple))
//                Slider(value: $accessibilityRange, from: 0, through: 1, by: 0.01).accentColor(Color(UIColor: UIColor.systemPurple))
            }.padding()
            
            VStack(alignment: .leading) {

                Stepper(onIncrement: {
                    self.stepperValue += 1
                }, onDecrement: {
                    self.stepperValue -= 1
                }) {
                    Text("Participants: ")
                }
                //TODO: Add stepperValue on label
                
//                Stepper("Participants: \(stepperValue)", value: $stepperValue, in: 1...10)
//                Stepper(value: $stepperValue, in: 1...10, label: { Text(String(format: "%d", "Participants:", stepperValue)}) )
//                Stepper(value: $stepperValue, in: 1...10) {
//                    Text("Participants: \(stepperValue)")
//                }
            }.padding()
            
            Button(action: {
                print("Before: \(self.service.activityResult)")

                self.service.getActivityBy(parameters: [[Endpoints.maxprice : String(self.priceRange)], [Endpoints.maxaccessibility : String(self.accessibilityRange)], [Endpoints.participants : String(self.stepperValue)]])
                
                print("After: \(self.service.activityResult)")
//                print("\(url)")
                self.isPresented = false
            }) {
                Text("Filter activities")
                    .padding()
                    .foregroundColor(Color(UIColor: UIColor.white))
                    .background(Color(UIColor: UIColor.systemPurple))
                    .cornerRadius(5.0)
            }
        }.padding(.top, -150)
    }
}

#if DEBUG
struct FilterView_Previews : PreviewProvider {
    static var previews: some View {
        FilterView(service: Service(), isPresented: .constant(true))
    }
}
#endif
