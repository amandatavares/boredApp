//
//  Enums.swift
//  boredApp
//
//  Created by Amanda Tavares on 15/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import Foundation

enum EndpointsBy: String {
    case key = "?key="
    case type = "?type="
    case participants = "?participants="
    case price = "?price="
    case accessibility = "?accessibility="
    
    var description: String {
        return self.rawValue
    }
}

enum Type: String {
    case education = "education"
    case recreational = "recreational"
    case social = "social"
    case diy = "diy"
    case charity = "charity"
    case cooking = "cooking"
    case relaxation = "relaxation"
    case music = "music"
    case busywork = "busywork"
    
    var description: String {
        return self.rawValue
    }
}
