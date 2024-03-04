//
//  APIError.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 4.03.2024.
//

import Foundation

/// API Return Error
struct APIError: Codable {
    let code: Int
    let message: String
}
