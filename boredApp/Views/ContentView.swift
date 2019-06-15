//
//  ContentView.swift
//  boredApp
//
//  Created by Amanda Tavares on 12/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var service = Service()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Categories")
                    .font(.headline)
                    .padding(.top, 5)
                HStack {
                    ForEach(Type.allCases.identified(by: \.self)) { type in
                        VStack(alignment: .leading) {
                            ScrollView(showsHorizontalIndicator: true) {
                                Button(action: { self.service.getActivityBy(endpoint: EndpointsBy.type.description, param: type.getName())
                                }) {
                                    TypeView(type: type)
                                }.accentColor(Color.primary)
                            }.frame(width: 80)
                        }
                    }
                }.padding(.horizontal)
               
                CardView(activity: service.activityResult)
                
                HStack {
                    Button(action: {
                        self.service.getActivityBy(endpoint: EndpointsBy.key.description, param: self.service.previousKey)
                    }) {
                        Text("Previous").padding()
                    }
                    Spacer()
                    Button(action: {
                        self.service.previousKey = self.service.activityResult.key

                        self.service.getActivity()
                    }) {
                        Text("Next").padding()
                    }
                }
            }.navigationBarTitle(Text("Find an activity"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif


