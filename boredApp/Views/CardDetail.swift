//
//  CardDetail.swift
//  boredApp
//
//  Created by Amanda Tavares on 13/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import SwiftUI

struct CardDetail : View {
    let activity: Activity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(activity.type)
                .font(.title)
                .color(.secondary)
            Divider()
            HStack {
                List {
                    Text("Participants")
                    Text("Acessibility ")
                    Text("Expensive")
                }
                List {
                    Text("\(activity.participants)")
                    Text("\(activity.accessibility)")
                    Text("\(activity.price)")
                }
            }
            .padding(.horizontal)
            .relativeHeight(0.9)
        }
            .navigationBarTitle(Text(activity.activity))
            .padding(.horizontal)

    }
}

#if DEBUG
struct CardDetail_Previews : PreviewProvider {
    static var previews: some View {
        CardDetail(activity: activityTest)
    }
}
#endif
