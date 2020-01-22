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
       VStack(alignment: .center, spacing: 0) {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundColor(Color(UIColor: self.type.getColor()))
                    .frame(width: geometry.size.width*0.8, height: geometry.size.height*0.5, alignment: .center)
                Image(uiImage: self.type.getIcon()).padding()
            }
        }
        Text(type.getName())
            .foregroundColor(Color.primary)
            .frame(minWidth: 0, idealWidth: 80, maxWidth: .infinity, minHeight: 0, idealHeight: 20, maxHeight: 30, alignment: Alignment.center)
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
