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
                CardView(activity: service.activityResult)
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Previous").padding()
                    }
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
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


