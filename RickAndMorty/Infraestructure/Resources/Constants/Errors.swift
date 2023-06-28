//
//  Errors.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation

struct NetworkError {
    static let decode = "Error decoding the data"
    static let invalidUrl = "Error creating URL"
    static let noInternet = "Internet connection is needed"
    static let notFound = "Error. Content not found"
    static let noResponse = "Error. No response from server"
    static func otherError(error: String) -> String { return "Unexpected error: \(error)" }
    static let sessionExpired = "Error. Session has expired"
    static let unauthorized = "Error. Unauthorized call to the server"
    static let unexpectedStatusCode = "Error. Unexpected status code"
}

