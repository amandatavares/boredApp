//
//  Service.swift
//  boredApp
//
//  Created by Amanda Tavares on 13/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//
import Foundation
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
//    let baseUrl = "http://www.boredapi.com/api/activity/"
    
   
    var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "www.boredapi.com"
        urlComponents.path = "/api/activity/"
        urlComponents.queryItems = [URLQueryItem]()

        return urlComponents
    }
   
 
    init() {
        getActivity()
    }
    func getActivity() {
        
        // String to url
        guard let url = self.urlComponents.url else {return}

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
                }
            } catch let error {
                print("Failed in \(error)")
            }
        }.resume()
    }
    
    func getActivityBy(parameters: [Endpoints:String]) {
//        urlComponents.setQueryItems(with: parameters)
        guard var queryItems = self.urlComponents.queryItems else {
            print("Negocio is nil")
            return
        }
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key.rawValue, value: "\(value)")
            queryItems.append(queryItem)
        }
//        if var queryItems = self.urlComponents.queryItems {
//            for (key, value) in parameters {
//                let queryItem = URLQueryItem(name: key.rawValue, value: "\(value)")
//                queryItems.append(queryItem)
//            }
////            print(queryItems)
//        }
        print(queryItems)
        print(self.urlComponents.queryItems)
        if let queryItems = self.urlComponents.queryItems {
//            print(queryItems)
            for queryItem in queryItems {
                print("\(queryItem.name): \(queryItem.value)")
            }
        }
        print(urlComponents.url!)
    }
}
