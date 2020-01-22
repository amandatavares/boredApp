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
    }
}

#if DEBUG
struct ToolButtonsView_Previews : PreviewProvider {
    static var previews: some View {
        ToolButtonsView()
    }
}
#endif
