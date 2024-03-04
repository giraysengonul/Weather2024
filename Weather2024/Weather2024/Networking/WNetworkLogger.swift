//
//  WNetworkLogger.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 2.03.2024.
//

import Foundation
/// WNetworkLogger Process
final class WNetworkLogger {
    /// Singleton
    static let shared = WNetworkLogger()
    
    /// Init Process
    private init(){}
    
    /// URLRequest Log Process
    /// - Parameter request: URLRequest
     public func log(request: URLRequest) {
        print("Request URL: \(request.url?.absoluteString ?? "")")
        if let headers = request.allHTTPHeaderFields {
            print("Request Headers: \(headers)")
        }
        if let body = request.httpBody {
            print("Request Body: \(String(data: body, encoding: .utf8) ?? "")")
        }
    }
    
    /// URLResPonse Process
    /// - Parameters:
    ///   - response: URLResponse
    ///   - data: Data
    public func log(response: URLResponse?, data: Data?) {
        if let httpResponse = response as? HTTPURLResponse {
            print("Response Status Code: \(httpResponse.statusCode)")
        }
        if let responseData = data {
            print("Response Data: \(String(data: responseData, encoding: .utf8) ?? "")")
        }
    }
}
