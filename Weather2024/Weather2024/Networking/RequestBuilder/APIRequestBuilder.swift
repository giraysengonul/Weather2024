//
//  RequestBuilder.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 4.03.2024.
//

import Foundation

/// Create request
final class APIRequestBuilder{
    
    /// Init
    init() {}
    
    /// Builder Request
    /// - Parameters:
    ///   - url: baseURL
    ///   - headers: URL Headers
    ///   - path: URL Path
    ///   - queryItems: URL QueryItems
    ///   - methot: URL httpMethod
    /// - Returns: URLRequest or nil
    public static func createRequest(with url: URL, headers: [String : String], path: String, queryItems: [URLQueryItem], methot: String) -> URLRequest?{
        
        guard let commonURL = URLComponents(url: url.appendingPathComponent(path).appending(queryItems: queryItems), resolvingAgainstBaseURL: true) else{
            return nil
        }
        guard let url = commonURL.url else{
            return nil
        }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = methot
        return request
    }
    
}
