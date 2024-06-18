//
//  CitiesWeatherListView.swift
//  WeatherApp
//
//  Created by solinum.dev on 12/02/2024.
//

import SwiftUI

struct CitiesWeatherListView: View {
    
    @StateObject private var viewModel: WeatherListViewModel
    
    init (viewModel: WeatherListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.citiesWeather) { cityWeather in
                    NavigationLink {
                        CitiesWeatherListRouter.makeDetailsDetailsView(cityWeather: cityWeather)
                    } label: {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading) {
                                Text(cityWeather.name ?? "")
                                    .font(.title3)
                                AsyncImage(url: URL(string: "https://openweathermap.org/img/w/"+(cityWeather.weather?.first?.icon ?? "")+".png")) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 30, height: 30)
                                Text(cityWeather.weather?.first?.main ?? "")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            VStack(alignment: .center) {
                                Text(String(format: "%.0f%@", cityWeather.main?.temp ?? 0, "°"))
                                    .font(.title)
                                HStack(alignment: .center) {
                                    Text(String(format: "%@%.0f%@", "H: ", cityWeather.main?.temp_max ?? 0, "°"))
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                    Text(String(format: "%@%.0f%@", "L: ", cityWeather.main?.temp_min ?? 0, "°"))
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    
                }
            }
            .listStyle(.inset)
            .padding()
        }
        .onAppear {
            viewModel.startFetching()
        }
    }
}

#Preview {
    CitiesWeatherListView(viewModel: WeatherListViewModel(weatherFetcher: WeatherAPI()))
}

