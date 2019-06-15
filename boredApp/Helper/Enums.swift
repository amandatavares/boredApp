//
//  Enums.swift
//  boredApp
//
//  Created by Amanda Tavares on 15/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import Foundation
import UIKit

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

enum Type: CaseIterable {
    case education
    case recreational
    case social
    case diy
    case charity
    case cooking
    case relaxation
    case music
    case busywork
    
}

extension Type {
    func getName() -> String {
        switch self {
        case .education:
            return "education"
        case .recreational:
            return "recreational"
        case .social:
            return "social"
        case .diy:
            return "diy"
        case .charity:
            return "charity"
        case .cooking:
            return "cooking"
        case .relaxation:
            return "relaxation"
        case .music:
            return "music"
        case .busywork:
            return "busywork"
        default:
            return " "
        }
    }
    
    func getIcon() -> UIImage {
        switch self {
        case .education:
            return UIImage(systemName: "book")!
        case .recreational:
            return UIImage(systemName: "gamecontroller")!
        case .social:
            return UIImage(systemName: "quote.bubble")!
        case .diy:
            return UIImage(systemName: "hammer")!
        case .charity:
            return UIImage(systemName: "rosette")!
        case .cooking:
            return UIImage(systemName: "thermometer")!
        case .relaxation:
            return UIImage(systemName: "house")!
        case .music:
            return UIImage(systemName: "music.note")!
        case .busywork:
            return UIImage(systemName: "speedometer")!
        default:
            return UIImage(systemName: "questionmark")!
        }
    }
    
    func getColor() -> UIColor {
        switch self {
        case .education:
            return UIColor.systemIndigo
        case .recreational:
            return UIColor.systemGreen
        case .social:
            return UIColor.systemRed
        case .diy:
            return UIColor.systemTeal
        case .charity:
            return UIColor.systemYellow
        case .cooking:
            return UIColor.systemOrange
        case .relaxation:
            return UIColor.systemPurple
        case .music:
            return UIColor.systemPink
        case .busywork:
            return UIColor.systemBlue
        default:
            return UIColor.gray
        }
    }
}

//let typeList: Type = [.]
