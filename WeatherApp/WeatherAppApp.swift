//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by solinum.dev on 07/02/2024.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    let viewModel = WeatherListViewModel(weatherFetcher: WeatherAPI())
    var body: some Scene {
        WindowGroup {
            CitiesWeatherListView(viewModel: viewModel)
        }
    }
}
