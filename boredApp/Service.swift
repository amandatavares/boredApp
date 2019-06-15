//
//  Service.swift
//  boredApp
//
//  Created by Amanda Tavares on 13/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import SwiftUI
import Combine

class Service: BindableObject {
    var didChange = PassthroughSubject<Service, Never>()
    var activityResult = Activity() {
        didSet {
            didChange.send(self)
        }
    }
    var previousKey: String = ""
    
    init() {
        loadData()
    }
    func loadData() {
        let baseUrl = "http://www.boredapi.com/api/activity/"
        // String to url
        guard let url = URL(string: baseUrl) else {return}
        
        // Singleton of URLSession to catch data through URL
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {return}
            if let err = error {
                print("Error \(err)")
            }
            do {
                let activityResult = try JSONDecoder().decode(Activity.self, from: data)
                print(activityResult)
                DispatchQueue.main.async {
                    self.activityResult = activityResult
                }
            } catch let error {
                print("Failed in \(error)")
            }
            }.resume()
    }
}
