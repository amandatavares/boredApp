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
    @State var service = Service()
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text("Categories")
                .font(.headline)
                .padding(.leading, 15)
            
            ScrollView(showsHorizontalIndicator: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(types.identified(by: \.self)) { type in
                        Button(action: {
                            self.service.getActivityBy(endpoint: EndpointsBy.type.description, param: type.getName())
                        }) {
                            TypeView(type: type)
                            }.accentColor(Color.primary)
                    }
                }
            }
        }
    }
}
