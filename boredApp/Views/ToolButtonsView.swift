//
//  ToolButtonsView.swift
//  boredApp
//
//  Created by Amanda Tavares on 17/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import SwiftUI

struct ToolButtonsView : View {
    @EnvironmentObject var service: Service
    
    var body: some View {
        return HStack {
            Button(action: {
                self.service.getActivityBy(parameters: [[Endpoints.key : self.service.previousKey]])
//                print("test")
            }) {
                Text("Previous")
                    .padding()
                    .accentColor(Color(UIColor: UIColor.systemPurple))
            }
            Spacer()
            Button(action: {
                self.service.previousKey = self.service.activityResult.key
                
                self.service.getActivityBy(parameters: nil)
            }) {
                Text("Next")
                    .padding()
                    .accentColor(Color(UIColor: UIColor.systemPurple))
            }
        }
    }
}

#if DEBUG
struct ToolButtonsView_Previews : PreviewProvider {
    static var previews: some View {
        ToolButtonsView().environmentObject(Service())
    }
}
#endif
