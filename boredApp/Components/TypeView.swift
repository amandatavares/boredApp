//
//  TypeView.swift
//  boredApp
//
//  Created by Amanda Tavares on 15/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import SwiftUI
import UIKit

struct TypeView : View {
    var type: Type
    
    var body: some View {
       VStack(alignment: .center) {
            ZStack {
                Circle()
                    .foregroundColor(Color(UIColor: type.getColor()))
//                    .relativeWidth(1)
//                    .relativeHeight(1)
                Image(uiImage: type.getIcon()).padding()
            }
            Text(type.getName()).foregroundColor(Color.primary)
                .frame(minWidth: 0, idealWidth: 80, maxWidth: .infinity, minHeight: 0, idealHeight: 10, maxHeight: 30, alignment: Alignment.center)
        }
        .padding(.leading, 15)
    }
}

#if DEBUG
struct TypeView_Previews : PreviewProvider {
    static var previews: some View {
        TypeView(type: Type.diy)
    }
}
#endif
