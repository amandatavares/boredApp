//
//  Enums.swift
//  boredApp
//
//  Created by Amanda Tavares on 15/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import Foundation
import UIKit

enum Endpoints: String {
    case key
    case type
    case participants
    case maxprice
    case maxaccessibility
}

enum Type: CaseIterable {
    case education
    case social
    case diy
    case charity
    case cooking
    case relaxation
    case music
    case busywork
    case recreational
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
        }
    }
    
    func getColor() -> UIColor {
        switch self {
        case .education:
            return UIColor.systemIndigo
        case .recreational:
            return UIColor.systemGray
        case .social:
            return UIColor.systemRed
        case .diy:
            return UIColor.systemTeal
        case .charity:
            return UIColor.systemYellow
        case .cooking:
            return UIColor.systemOrange
        case .relaxation:
            return UIColor.systemGreen
        case .music:
            return UIColor.systemPink
        case .busywork:
            return UIColor.systemBlue
        }
    }
}

//let typeList: Type = [.]
