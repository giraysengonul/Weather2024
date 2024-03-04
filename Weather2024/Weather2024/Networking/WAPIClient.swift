//
//  WAPIClient.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 2.03.2024.
//

import Foundation
/// WApiClient process
final class WAPIClient{
    /// Singleton
    static let shared = WAPIClient()
    
    //Elements
    private let urlSessionProvider: URLSessionProvider
    private let responseError: ResponseError
    private let responseParser: ResponseParser
    private let wNetworkLogger: WNetworkLogger
    
    /// Init process
    /// - Parameters:
    ///   - urlSessionProvider: urlSessionProvider
    ///   - responseError: responseError
    ///   - responseParser: responseParser
    ///   - wNetworkLogger: wNetworkLogger
    private init(
        urlSessionProvider: URLSessionProvider = URLSessionProvider(),
        responseError: ResponseError = ResponseError(),
        responseParser: ResponseParser = ResponseParser(),
        wNetworkLogger: WNetworkLogger = WNetworkLogger.shared
    )
    {
        self.urlSessionProvider = urlSessionProvider
        self.responseError = responseError
        self.responseParser = responseParser
        self.wNetworkLogger = wNetworkLogger
    }
    
    /// Fetch Data Process
    /// - Parameter endPoint: WEndPoint
    /// - Parameter parsingModel: T.type Codable Model
    /// - Parameter completion: Data or Error
    public func fetchData<T:Codable>(_ endPoint: WEndpoint, parsingModel: T.Type ,completion: @escaping(Result<T,Error>) -> Void){
        guard ReachabilityHelper.isConnectedToNetwork() else{
            print("Not connected to the internet")
            return
        }
        guard let request = endPoint.makeRequest() else{ return }
        wNetworkLogger.log(request: request)
        urlSessionProvider.fethData(urlRequest: request) {[weak self] data, response, error in
            if error != nil{
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                self?.wNetworkLogger.log(httpResponse: httpResponse, data: nil)
                completion(.failure(self?.responseError.parseError(statusCode: httpResponse.statusCode) ?? .unknownError))
                return
            }
            guard let data = data else{
                completion(.failure(NetworkError.noData))
                return
            }
            self?.wNetworkLogger.log(response: response, data: data)
            self?.responseParser.responseParser(responseData: data, responseModel: parsingModel) { result in
                switch result{
                case .success(let data):
                    completion(.success(data))
                    return
                case .failure(let error):
                    completion(.failure(error))
                    return
                }
            }
        }.resume()
        
        
    }
    
}
