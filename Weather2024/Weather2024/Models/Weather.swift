//
//  Weather.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 4.03.2024.
//

import Foundation
struct Weather: Codable{
    let result: [WeatherResult]
}

struct WeatherResult: Codable{
    let date: String
    let day: String
    let icon: String
    let description: String
    let status: String
    let degree: String
    let min: String
    let max: String
    let night: String
    let humidity: String
}
