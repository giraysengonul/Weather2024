//
//  ViewController.swift
//  Weather2024
//
//  Created by Hakkı Can Şengönül on 2.03.2024.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let endPoint = WEndpoint.locationWeatherFetchData( query: [URLQueryItem(name: "data.lang", value: "tr"), URLQueryItem(name: "data.city", value: "kayseri")])
        WAPIClient.shared.fetchData(endPoint, parsingModel: Weather.self) { result in
            switch result {
            case .success(let model):
                print(model)
                return
            case .failure(let failure):
                print(failure)
            }
        }
    }


}

