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
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                TypeRow(types: Type.allCases)
               
                CardView(activity: service.activityResult)
                    .offset(x: 0, y: -50)
                    .padding(.top, -50)
                
                ToolButtonsView()
                
            }
                .navigationBarTitle(Text("Find an activity"))
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isPresented = true
                    }, label: {
                        Image(uiImage: UIImage(systemName: "line.horizontal.3.decrease.circle.fill")!).padding()
                    })).presentation( isPresented ? Modal(FilterView(), onDismiss: { self.isPresented.toggle() }) : nil )
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






