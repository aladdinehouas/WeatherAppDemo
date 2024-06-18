//
//  CitiesWeatherListRouter.swift
//  WeatherApp
//
//  Created by Aladdin Houas on 18/06/2024.
//

import SwiftUI

enum CitiesWeatherListRouter {
    static func makeDetailsDetailsView(cityWeather: CityWeather) -> some View {
        let view = CityWeatherDetailsView(model: cityWeather)
        return view
    }
}
