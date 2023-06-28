//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation


protocol Endpoint {
    var body: [String: String]? { get }
    var headers: [String: String]? { get }
    var host: String { get }
    var method: HttpMethod { get }
    var parameters: [URLQueryItem]? { get }
    var path: String { get }
    var scheme: String { get }
    var url: URL? { get }
}

extension Endpoint {
    
    var body: [String:String]? { return nil }
    var headers: [String : String]? { return nil }
    var host: String { return Host.base }
    var method: HttpMethod { return .get }
    var parameters: [URLQueryItem]? { return nil }
    var scheme: String { return Scheme.https }
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = parameters
    
        return urlComponents.url
    }
}
