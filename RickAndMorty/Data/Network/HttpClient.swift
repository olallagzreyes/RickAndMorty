//
//  HttpClient.swift
//  RickAndMorty
//
//  Created by Olalla Gómez Reyes on 22/6/23.
//

import Foundation
import Factory

protocol HttpClient {
    
    typealias NetworkResponse = (data: Data, response: URLResponse)
    func sendRequest<T: Codable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, ApiError>
}


extension HttpClient {
    
    func sendRequest<T: Codable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, ApiError> {
        
        guard InternetConnectionManager.isConnectedToNetwork() else {
            return .failure(.noInternet)
        }
        
        guard let url = endpoint.url else { return .failure(.invalidUrl) }
        Log.d(tag: "URL", message: url.absoluteString)
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        do {
            let result: NetworkResponse = try await URLSession.shared.data(for: request, delegate: nil)
            
            guard let response = result.response as? HTTPURLResponse else {
                return .failure(.noResponse)
                
            }
            print("STATUS CODE: \(response.statusCode)")
            switch response.statusCode {
            case 200...299:
                
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: result.data) else {
                    return .failure(.decode)
                }
                // Transform into a JSON to read it as a log
               /* if let json = try? JSONSerialization.jsonObject(with: result.data, options: .mutableContainers) {
                    Log.d(tag: "BODY RESPONSE", message: (String(describing: json)))
                }*/
                return .success(decodedResponse)
            case 404:
                return .failure(.notFound)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.otherError(error: error.localizedDescription))
        }
    }
}

