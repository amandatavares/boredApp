//
//  Activity.swift
//  boredApp
//
//  Created by Amanda Tavares on 12/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct Activity: Decodable {
    var activity: String = ""
    var accessibility: Double = 0.0
    var type: String = ""
    var participants: Int = 0
    var price: Double = 0.0
    var link: String? = nil
    var key: String = ""
}

let activityTest = Activity(activity: "Fazer hambúrguer artesenal na casa do diferenciado", accessibility: 1.0, type: "DIY", participants: 1, price: 0.6, link: nil, key: "1111")
