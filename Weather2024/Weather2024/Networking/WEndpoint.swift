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
                return [
                    "content-type":"application/json",
                    "authorization":"apikey 1zp4wLipWiy1GeG0wf4ueT:1sHDkZfQbmdsWyi434bKUk"
                ]
            }
        }
    }
    
    /// Make Request
    /// - Returns: callback URLRequest
    public func makeRequest() -> URLRequest? {
        guard let queryItem = queryItem else {
            return nil
        }
        return RequestBuilder.createRequest(with: url, headers: headers, path: path, queryItems: queryItem, methot: methot)
    }
    
}
