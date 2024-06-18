//
//  WeatherLoaderViewModel.swift
//  WeatherApp
//
//  Created by solinum.dev on 07/02/2024.
//

import Foundation
import Combine

protocol WeatherListViewModelInterface: ObservableObject {
    var citiesWeather: [CityWeather] { get set }
    init(weatherFetcher: WeatherFetchable)
    func fetchWeather(for cityName: String)
}


class WeatherListViewModel {
    @Published var citiesWeather: [CityWeather]
    private let weatherFetcher: WeatherFetchable
    private var disposables = Set<AnyCancellable>()
    private let cities = ["Paris,fr", "Nantes,fr", "Bordeaux,fr", "Lyon,fr", "Rennes,fr", "Nice,fr"]
    
    required init(weatherFetcher: WeatherFetchable) {
        self.weatherFetcher = weatherFetcher
        self.citiesWeather = [CityWeather]()
    }
    
    func startFetching() {
        for city in cities {
            fetchWeather(for: city)
        }
    }
        
}

//MARK: - PhotosListViewModelInterface Extension

extension WeatherListViewModel: WeatherListViewModelInterface {
    func fetchWeather(for cityName: String) {
        weatherFetcher
            .fetchWeather(for: cityName)
            .receive(on: DispatchQueue.main)
            .sink { value in
                switch value {
                case .failure:
                    break
                case .finished:
                    break
                }
            } receiveValue: { [weak self] cityResponse in
                self?.citiesWeather.append(cityResponse)
                print(cityResponse)
            }
            .store(in: &disposables)
    }
}
