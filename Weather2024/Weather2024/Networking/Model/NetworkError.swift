//
//  NetworkError.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 4.03.2024.
//

import Foundation

/// NetworkError
@frozen enum NetworkError: Error{
    case invalidURL
    case invalidRequest
    case invalidResponse
    case statusCode(Int)
    case noData
    case decodeError
    case networkError(Error)
    case clientError(Int)
    case serverError(Int)
    case unknownError
}
