//
//  WeatherServiceTests.swift
//  WeatherServiceTests
//
//  Created by Hakkı Can Şengönül on 5.03.2024.
//

import XCTest
@testable import Weather2024

final class WeatherServiceTests: XCTestCase {
    var weather: Weather?
    var weatherData: Data?
    var mockError: NSError?
    var sessionconfiguration: URLSessionConfiguration?
    var session: URLSession?
    var urlSessionProvider: URLSessionProvider?
    var apiCliect: WAPIClient?
    var service: WeatherService?
    var endPoint: WEndpoint?
    
    
    override func setUpWithError() throws {
        
         weather = Weather(result: [.init(date: "05.03.2024", day: "Salı", icon: "https://cdnydm.com/permedia/fji5nQfowvEYJBdnLsvrgA.png?size=512x512", description: "parçalı az bulutlu", status: "Clouds", degree: "13.13", min: "4.94", max: "15.01", night: "9.57", humidity: "30")])
         weatherData = try? JSONEncoder().encode(weather)
         mockError = NSError(domain: "TestError", code: 404, userInfo: nil)
        
         sessionconfiguration = URLSessionConfiguration.ephemeral
         sessionconfiguration!.protocolClasses = [MockURLProtocol.self]
         session = URLSession(configuration: sessionconfiguration!)
         urlSessionProvider = URLSessionProvider(urlSession: session!)
         apiCliect = WAPIClient(urlSessionProvider: urlSessionProvider!)
         service = WeatherService(apiClient: apiCliect!)
         endPoint = WEndpoint.locationWeatherFetchData(query: [URLQueryItem(name: "abc", value: "sss")])
    }

    override func tearDownWithError() throws {
        weather = nil
        weatherData = nil
        mockError = nil
        sessionconfiguration = nil
        session = nil
        urlSessionProvider = nil
        apiCliect = nil
        service = nil
        endPoint = nil
    }

    func testWeatherExample_returnSuccess() throws {
        
        //arrange
        MockURLProtocol.data = weatherData
        let expectation = self.expectation(description: "For expectation")
        //act
        service?.fetchWeather(endPoint: endPoint ?? .fetchData) { result in
            switch result {
            case .success(let model):
                print(model)
                //assert
                XCTAssertNotNil(model)
                expectation.fulfill()
            case .failure(_):
                break
            }
        }
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testWeatherFetchData_returnFailed() throws{
        //arc
        MockURLProtocol.error = mockError
        let expectation = self.expectation(description: "testWeatherFetchData_returnFailed")
        //arrange
        service?.fetchWeather(endPoint: endPoint ?? .fetchData) { result in
            switch result {
            case .success(_):
                break
            case .failure(let failure):
                XCTAssertNotNil(failure)
                print(failure.localizedDescription)
                expectation.fulfill()
                break
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
}

