//
//  ContentView.swift
//  boredApp
//
//  Created by Amanda Tavares on 12/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @ObservedObject var service = Service()
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
//            this spacing 150 is wrong in 150 ways
            VStack(alignment: .center, spacing: 150) {
                TypeRow(types: Type.allCases).environmentObject(service)
               
                CardView(activity: self.service.activityResult)
                
                ToolButtonsView().environmentObject(service)
            }
                .navigationBarTitle(Text("Find an activity"))
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isPresented = true
                    }){
                        Image(uiImage: UIImage(systemName: "line.horizontal.3.decrease.circle.fill")!).padding()
                    }.sheet(isPresented: $isPresented) {
                        FilterView(isPresented: self.isPresented)
                    })
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






