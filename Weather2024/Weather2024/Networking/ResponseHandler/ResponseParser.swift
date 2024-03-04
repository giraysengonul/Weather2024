//
//  ResponseParser.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 4.03.2024.
//

import Foundation
/// Response parse processing
final class ResponseParser {
    
    /// Response Data
    /// - Parameters:
    ///   - responseData: data
    ///   - responseModel: model
    ///   - completion: T(parsingData) or NetworkError
    public func responseParser<T:Codable>(responseData: Data, responseModel: T.Type, completion: @escaping(Result<T,NetworkError>) -> Void){
        
        do{
            let decoder = JSONDecoder()
            let responseData = try decoder.decode(T.self, from: responseData)
            completion(.success(responseData))
            return
        }catch{
            completion(.failure(.decodeError))
            return
        }
    }
}
