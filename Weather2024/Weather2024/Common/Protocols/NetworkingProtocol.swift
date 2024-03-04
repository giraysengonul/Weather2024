//
//  NetworkingProtocol.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 4.03.2024.
//

import Foundation
protocol NetworkingProtocol {
    func fethData(urlRequest request: URLRequest, completion: @escaping(Data?, URLResponse?, Error? ) -> Void) -> URLSessionDataTask
}
