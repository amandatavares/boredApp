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
    var key: String = ""
    var accessibility: Double = 0.0
    var type: String = ""
    var participants: Int = 0
    var price: Double = 0.0
    var link: String?
    
    init(activity: String, key: String, accessibility: Double, type: String, participants: Int, price: Double, link: String) {
         self.activity = activity
         self.key = key
         self.accessibility = accessibility
         self.type = type
         self.participants = participants
         self.price = price
         self.link = link
    }
}

//let activityTest = Activity(activity: "Fazer hambúrguer artesenal", key: "1111", accessibility: 1.0, type: "DIY", participants: 1, price: 0.6, link: nil)
