//
//  URLSessionProvider.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 4.03.2024.
//

import Foundation

/// Single URLSessionProvider
final class URLSessionProvider: NetworkingProtocol {
    
    /// Init
      init() {}
    
    /// Fetch Data Processing
    /// - Parameters:
    ///   - request: URLRequest
    ///   - completion: Data or URLResponse or Error
    /// - Returns: URLSessionDataTask
    public func fethData(urlRequest request: URLRequest, completion: @escaping(Data?, URLResponse?, Error? ) -> Void) -> URLSessionDataTask{
        return URLSession.shared.dataTask(with: request, completionHandler: completion)
    }
    
}
