//
//  ApiError.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation

enum ApiError: Error {
    case decode
    case invalidUrl
    case noInternet
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case notFound
    case otherError(error: String)
    case sessionExpired
    
    var customMessage: String {
        switch self {
        case .decode:
            return NetworkError.decode
        case .invalidUrl:
            return NetworkError.invalidUrl
        case .noInternet:
            return NetworkError.noInternet
        case .noResponse:
            return NetworkError.noResponse
        case .unauthorized:
            return NetworkError.unauthorized
        case .unexpectedStatusCode:
            return NetworkError.unexpectedStatusCode
        case .notFound:
            return NetworkError.notFound
        case .otherError(let error):
            return NetworkError.otherError(error: error)
        case .sessionExpired:
            return NetworkError.sessionExpired
        }
    }
}
