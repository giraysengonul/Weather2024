//
//  URLSessionProvider.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 4.03.2024.
//

import Foundation

/// Single URLSessionProvider
final class URLSessionProvider: NetworkingProtocol {
    
    private let urlSession: URLSession
    
    /// Init
    /// - Parameter urlSession: URLSession
    init
    (
        urlSession: URLSession = .shared
    )
    {
        self.urlSession = urlSession
    }
    
    /// Fetch Data Processing
    /// - Parameters:
    ///   - request: URLRequest
    ///   - completion: Data or URLResponse or Error
    /// - Returns: URLSessionDataTask
    public func fethData(urlRequest request: URLRequest, completion: @escaping(Data?, URLResponse?, Error? ) -> Void) -> URLSessionDataTask{
        return urlSession.dataTask(with: request, completionHandler: completion)
    }
    
}
