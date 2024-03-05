//
//  WEndpoint.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 2.03.2024.
//

import Foundation
/// WEndpoint Process
@frozen enum WEndpoint{
    //fetchData
    case fetchData
    //locationWeatherFetchData
    case locationWeatherFetchData(query: [URLQueryItem]?)
    
    /// create URL
    private var url: URL{
        get{
            switch self{
            case .fetchData:
                return URL(string: "aaa")!
            case .locationWeatherFetchData(_):
                return URL(string: "https://api.collectapi.com/weather")!
            }
        }
    }
    
    /// Adding path to URL
    private var path: String{
        switch self{
        case .fetchData:
            return ""
        case .locationWeatherFetchData(_):
            return "/getWeather"
        }
    }
    
    /// Adding methot to URL
    private var methot: String{
        get{
            switch self{
            case .fetchData:
                return "GET"
            case .locationWeatherFetchData(_):
                return "GET"
            }
        }
    }
    
    /// Adding queryItem to URL
    private var queryItem: [URLQueryItem]?{
        get{
            switch self{
            case .fetchData:
                return nil
            case .locationWeatherFetchData(query: let query):
                return query
            }
        }
    }
    
    /// Adding headers to URL
    private var headers: [String: String]{
        get{
            switch self{
            case .fetchData:
                return [:]
            case .locationWeatherFetchData(_):
                guard let apiKey = getAPIKey() else { return [:] }
                return [
                    "content-type" : "application/json",
                    "authorization" : apiKey
                ]
            }
        }
    }
    
    /// GET API KEY
    /// - Returns: apikey or nil
    private func getAPIKey() -> String? {
        guard let apiKeyData = KeychainWrapper.shared.load(key: "APIKEY") else { return nil }
        return String(data: apiKeyData, encoding: .utf8)
    }
    
    /// Make Request
    /// - Returns: callback URLRequest
    public func makeRequest() -> URLRequest? {
        guard let queryItem = queryItem else {
            return nil
        }
        return APIRequestBuilder.createRequest(with: url, headers: headers, path: path, queryItems: queryItem, methot: methot)
    }
    
}
