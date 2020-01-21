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
            VStack {
                TypeRow(types: Type.allCases)
               
                GeometryReader { geometry in
                CardView(activity: self.service.activityResult)
                    .frame(width: geometry.size.width*0.9, height: geometry.size.width*0.8, alignment: .center)
                }
                ToolButtonsView()
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






