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

class Service: ObservableObject {
    @Published var activityResult = Activity()
    
    var previousKey: String = ""
    let baseUrl = "http://www.boredapi.com/api/activity/"
   
    var urlComponents: URLComponents
   
    init() {
        self.urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "www.boredapi.com"
        urlComponents.path = "/api/activity/"
        
        getActivity(from: self.urlComponents.url?.absoluteURL)
        print(self.urlComponents.url?.absoluteString ?? "")
    }
    func getActivity(from url: URL?) {
        
        // String to url
        guard let url = url else {return}

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
                    print(self.activityResult.activity)
                }
            } catch let error {
                print("Failed in \(error)")
            }
        }.resume()
    }
    
    func getActivityBy(parameters: [[Endpoints:String]]?) {
        // clear queries
        self.urlComponents.queryItems = nil
        
        var queryItems = [URLQueryItem]()
        
        if let parameters = parameters {
            for param in parameters {
                for (key, value) in param {
                    let queryItem = URLQueryItem(name: key.rawValue, value: "\(value)")
                    queryItems.append(queryItem)
                }
            }
            self.urlComponents.queryItems = queryItems
        }
        else {
            self.urlComponents.queryItems = nil
        }
        
//        getActivity(from: self.urlComponents.url)
        
        URLSession.shared.dataTask(with: self.urlComponents.url!) { (data, _, error) in
            guard let data = data else {return}
            if let err = error {
                print("Error \(err)")
            }
            do {
                let activityResult = try JSONDecoder().decode(Activity.self, from: data)
                
                //print(Type.allCases)
                DispatchQueue.main.async {
                    self.activityResult = activityResult
                }
            } catch let error {
                print("Failed in \(error)")
            }
        }.resume()
    }
    
}
