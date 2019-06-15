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
//    var previousKey: String?
    
    var body: some View {
        NavigationView {
            VStack {
                CardView(activity: service.activityResult)
                HStack {
                    Button(action: {
                        self.service.loadData()
                    }) {
                        Text("Previous").padding()
                    }
                    Spacer()
                    Button(action: {
                        self.service.previousKey = self.service.activityResult.key

                        self.service.loadData()
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


