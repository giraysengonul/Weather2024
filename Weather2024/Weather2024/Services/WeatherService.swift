//
//  WeatherService.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 4.03.2024.
//

import Foundation

/// Weather Service Process
final class WeatherService: WeatherServiceProtocol{
    
    private let apiClient: WAPIClient
    
    /// Init
    /// - Parameter apiClient: WAPICient
    init(
        apiClient: WAPIClient = WAPIClient.shared
    )
    {
        self.apiClient = apiClient
    }
    
    /// Fetch Weather Data
    /// - Parameters:
    ///   - endPoint: WEndpoint
    ///   - completion: Weather(Model) or Error
    public func fetchWeather(endPoint: WEndpoint ,completion: @escaping(Result<Weather,Error>)->Void){
        
        apiClient.fetchData(endPoint, parsingModel: Weather.self) { result in
            switch result {
            case .success(let model):
                completion(.success(model))
                return
            case .failure(let error):
                completion(.failure(error))
                return
            }
        }
        
    }
}
