//
//  CardView.swift
//  boredApp
//
//  Created by Amanda Tavares on 12/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import SwiftUI

struct CardView : View {
    var activity: Activity
//    destination: CardDetail(activity: activity), isDetail: true
    var body: some View {
        NavigationLink(destination: CardDetail(activity: activity)) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
//                    .padding()
//                    .relativeWidth(0.9)
//                    .relativeHeight(1)
                    .foregroundColor(Color.white)
                    .shadow(radius: 5.0)
                VStack(alignment: .leading) {
                    Text(activity.activity)
                        .font(.title)
                        .foregroundColor(Color.primary)
                        .fontWeight(.semibold)
                        .lineLimit(3)
                        .padding([.leading, .bottom, .trailing])
                        .truncationMode(.tail)
                    Text(activity.type)
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color.secondary)
                        .padding([.leading, .trailing])
                }.padding()
            }.padding()
        }
    }
}

#if DEBUG
struct CardView_Previews : PreviewProvider {
    static var previews: some View {
        CardView(activity: activityTest)
    }
}
#endif
