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
    
    var body: some View {
        return NavigationLink(destination: CardDetail(activity: activity)) {
            
            ZStack {
                RoundedRectangle(cornerRadius: CGFloat(integerLiteral: 10))
//                    .relativeWidth(0.95)
//                    .relativeHeight(1)
                    .foregroundColor(Color(UIColor: UIColor.systemGray6))
                    .shadow(radius: CGFloat(integerLiteral: 5))
                VStack(alignment: .leading) {
                    Text(activity.activity)
                        .font(.title)
                        .foregroundColor(Color.primary)
                        .fontWeight(.semibold)
                        .lineLimit(5)
                        .padding()
//                        .padding([.leading, .trailing])
//                        .truncationMode(.tail)
                    Text(activity.type)
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color.secondary)
                        .padding()
//                        .padding([.leading, .trailing])
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
