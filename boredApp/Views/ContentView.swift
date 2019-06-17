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
                TypeRow(types: Type.allCases, service: self.service)
               
                CardView(activity: service.activityResult)
                    .offset(x: 0, y: -50)
                    .padding(.top, -50)
                
                ToolButtonsView(service: self.service)
                
            }
                .navigationBarTitle(Text("Find an activity"))
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isPresented = true
                    }, label: {
                        Image(uiImage: UIImage(systemName: "line.horizontal.3.decrease.circle.fill")!).padding()
                    }).accentColor(Color(UIColor: UIColor.systemPurple))
                ).presentation( isPresented ? Modal(modalPresentation, onDismiss: { self.isPresented.toggle() }) : nil )

        }
    }
    var modalPresentation: some View {
        NavigationView {
                FilterView(service: self.service)
                .font(.caption)
                .navigationBarTitle(Text("Filter"), displayMode: .inline)
                    .navigationBarItems(leading: Button(action: { self.isPresented = false } ) {
                        Image(uiImage: UIImage(systemName: "xmark.circle.fill")!).padding()
                        }, trailing: Button(action: { self.isPresented = false } ) {
                            Image(uiImage: UIImage(systemName: "arrowshape.turn.up.left.circle.fill")!).padding()
                    }).accentColor(Color(UIColor: UIColor.systemPurple))
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






