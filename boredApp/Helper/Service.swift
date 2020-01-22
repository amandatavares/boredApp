//
//  Service.swift
//  boredApp
//
//  Created by Amanda Tavares on 13/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import SwiftUI
import Combine

class Service: ObservableObject {
    
    @Published var activityResult = Activity()

    var previousKey: String = ""
    let baseUrl = "http://www.boredapi.com/api/activity/"

    init() {
        getActivity()
    }
    func getActivity(from url: String = "http://www.boredapi.com/api/activity/") {
        // String to url
        guard let url = URL(string: url) else {return}
        
        // Singleton of URLSession to catch data through URL
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {return}
            if let err = error {
                print("Error \(err)")
            }
            do {
                let activityResult = try JSONDecoder().decode(Activity.self, from: data)
                
//                print(Type.allCases)
                DispatchQueue.main.async {
                    self.activityResult = activityResult
                    print(self.activityResult)
                }
            } catch let error {
                print("Failed in \(error)")
            }
        }.resume()
        
        print(url)
        
    }
    func getActivityBy(endpoint:String, param: String) {
        getActivity(from: self.baseUrl+endpoint+param)
    }
}
