//
//  TypeRow.swift
//  boredApp
//
//  Created by Amanda Tavares on 16/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import SwiftUI

struct TypeRow : View {
    var types: [Type]
    @EnvironmentObject var service: Service
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text("Categories")
                .font(.headline)
                .padding(.leading,15)
                .padding(.bottom,10)
            
            ScrollView {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(types, id: \.self) { type in
                        Button(action: {
                            self.service.getActivityBy(parameters: [[Endpoints.type : type.getName() ]])
                        }) {
                            TypeView(type: type)
                        }.accentColor(Color.primary)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct TypeRow_Previews : PreviewProvider {
//    @EnvironmentObject var service: Service
    static var previews: some View {
        TypeRow(types: Type.allCases).environmentObject(Service())
    }
}
#endif
