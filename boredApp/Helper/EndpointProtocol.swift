//
//  EndpointProtocol.swift
//  boredApp
//
//  Created by Amanda Tavares on 18/06/19.
//  Copyright © 2019 Amanda Tavares. All rights reserved.
//

/* Practice/reinforce understanding of applying an Endpoint protocol to construct a url based on filter params of the awesome
 "An API of Ice and Fire" API https://anapioficeandfire.com
 
 Modeled after @pasanpr treehouse course
 "Displaying Data with TableViews in Swift 2" https://teamtreehouse.com/library/displaying-data-with-table-views-in-swift-2
 which constructs endpoints using enums and assoc values based on the Foursquare API via an Endpoint protocol
 
 todo:
 add the character and house filter params;
 expand into a demo single view project applying a table UI w/ a search field to input the params
 
 */

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var urlParams: [String: AnyObject] { get }
}

//declare two new variables in an extension and their default implementation:
extension Endpoint {
    //We need this as a property for an URLComponents object we will initialize elsewhere
    var encodedQueryParams: [URLQueryItem] {
        var queryItemsArray = [URLQueryItem]()
        
        for (key, value) in self.urlParams  {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            queryItemsArray.append(queryItem)
        }
        
        return queryItemsArray
    }
    
    //assemble the request based on URLComponents
    var encodedRequest: URLRequest {
        let urlComponents = URLComponents(string: self.baseURL)!
        urlComponents.path = self.path
        urlComponents.queryItems = self.encodedQueryParams as [URLQueryItem]
        print("\(encodedQueryParams)")
        //we now have everything we need to construct a full url:
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum IceAndFire {
    
    case Book(BookEndpoint)//Character(CharacterEndpoint, House(HouseEndpoint)
    
    //nested type
    enum BookEndpoint: Endpoint {
        case BookFilter(name: String?)
        //case byId?
        
        //note - not defined in an extension
        var baseURL: String {
            return "http://www.anapioficeandfire.com"
        }
        
        var path: String {
            switch self {
            case .BookFilter(name: _):
                return "/api/books"
            }
        }
        
        struct BookParamKeys {
            static let name = "name"
        }
        
        var urlParams: [String: AnyObject] {
            switch self {
            case .BookFilter(let name):
                var paramsDict = [String: AnyObject]()
                if let name = name {
                    paramsDict[BookParamKeys.name] = name as AnyObject
                }
                
                return paramsDict
            }
        }
    }
    
}

//have the base enum/type conform to Endpoint as well
extension IceAndFire: Endpoint {
    
    var baseURL: String {
        switch self {
        case .Book(let bookEndpoint):
            return bookEndpoint.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .Book(let bookEndpoint):
            return bookEndpoint.path
        }
    }
    
    var urlParams: [String: AnyObject] {
        switch self {
        case .Book(let bookEndpoint):
            return bookEndpoint.urlParams
        }
    }
}

//now lets try it out
final class IceAndFireFilter {
    /*
     placeholder: define session and session config and init methods in full implementation
     */
    
    func fetchBookWith(name: String) {
        let bookEndpoint = IceAndFire.BookEndpoint.BookFilter(name: name)
        let endpoint = IceAndFire.Book(bookEndpoint)
        //at this point would feed endpoint into a fetch method that makes an API request based on type Endpoint and via a completion handler could create an instance of a model object
        
        print(endpoint.encodedRequest)
    }
    
}

let iceAndFireFilter = IceAndFireFilter()
iceAndFireFilter.fetchBookWith(name: "a game of thrones")
// http://www.anapioficeandfire.com/api/books?name=a%20game%20of%20thrones
