//
//  MockURLProtocol.swift
//  Weather2024Tests
//
//  Created by Hakkı Can Şengönül on 5.03.2024.
//

import Foundation

class MockURLProtocol: URLProtocol{
    static var data: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let mockData = MockURLProtocol.data {
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.data ?? Data())
        }else if let error = MockURLProtocol.error{
            self.client?.urlProtocol(self, didFailWithError: error )
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
    
    
}
