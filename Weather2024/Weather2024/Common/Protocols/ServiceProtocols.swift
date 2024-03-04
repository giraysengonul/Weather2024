//
//  ServiceProtocols.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 4.03.2024.
//

import Foundation
protocol WeatherServiceProtocol {
     func fetchWeather(endPoint: WEndpoint, completion: @escaping(Result<Weather,Error>)->Void)
}
