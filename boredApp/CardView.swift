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
        return NavigationButton(destination: CardDetail(activity: activity), isDetail: true) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .padding()
                    .relativeHeight(0.9)
                    .foregroundColor(Color.white)
                    .shadow(radius: Length(integerLiteral: 10))
                VStack(alignment: .leading) {
                    Text(activity.activity)
                        .font(.title)
                        .color(Color.primary)
                        .fontWeight(.bold)
                        .lineLimit(3)
                        .padding([.leading, .bottom, .trailing])
                        .truncationMode(.tail)
                    Text(activity.type)
                        .font(.title)
                        .color(Color.secondary)
                        .padding([.leading, .trailing])
                }
            }
        }
    }
}

//#if DEBUG
//struct CardView_Previews : PreviewProvider {
//    static var previews: some View {
//        CardView(activity: )
//    }
//}
//#endif
