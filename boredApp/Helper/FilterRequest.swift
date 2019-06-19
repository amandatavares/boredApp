//
//  FilterRequest.swift
//  boredApp
//
//  Created by Amanda Tavares on 18/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

import Foundation

enum StarWarsAPIResources: String {
    case planets, spaceships, vehcicles, people, films, species
}

enum StarWarsAPIFormat: String {
    case wookiee, json
}

struct StarWarsAPIRepository {
    
    private init() {}
    static let shared = StarWarsAPIRepository()
    
    private let urlSession = URLSession.shared
    var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "swapi.co"
        return urlComponents
    }
    
    func fetchData(with resources: StarWarsAPIResources, format: StarWarsAPIFormat, completion: @escaping(Data?, Error?) -> Void) {
        fetch(with: resources, parameters: [
            "format": format.rawValue
            ], completion: completion)
    }
    
    func searchData(with resources: StarWarsAPIResources, format: StarWarsAPIFormat, search: String, completion: @escaping(Data?, Error?) -> Void) {
        fetch(with: resources, parameters: [
            "format": format.rawValue,
            "search": search
            ], completion: completion)
    }
    
    private func fetch(with resources: StarWarsAPIResources, parameters: [String: String], completion: @escaping(Data?, Error?) -> Void) {
        var urlComponents = self.urlComponents
        urlComponents.path = "/api/\(resources)"
        urlComponents.setQueryItems(with: parameters)
        guard let url = urlComponents.url else {
            completion(nil, NSError(domain: "", code: 100, userInfo: nil))
            return
        }
        urlSession.dataTask(with: url) { (data, _, error) in
            completion(data, error)
            }.resume()
    }
    
}

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
}

//https://swapi.co/api/films?format=json
StarWarsAPIRepository.shared.fetchData(with: .films, format: .json) { (data, error) in
    // Convert JSON Data to Object
}

// https://swapi.co/api/people?search=Obi%20Wan%20Kenobi&format=wookiee
StarWarsAPIRepository.shared.searchData(with: .people, format: .wookiee, search: "Obi Wan Kenobi") { (data, error) in
    // Convert JSON Data to Object
}
