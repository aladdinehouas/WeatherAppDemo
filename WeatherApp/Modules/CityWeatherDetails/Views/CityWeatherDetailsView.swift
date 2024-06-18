//
//  CityWeatherDetailsView.swift
//  WeatherApp
//
//  Created by Aladdin Houas on 17/06/2024.
//

import SwiftUI

struct CityWeatherDetailsView: View {
    
    private var cityWeatherModel: CityWeather
    
    init (model: CityWeather) {
        cityWeatherModel = model
    }
    
    var body: some View {
        VStack{
            Text(cityWeatherModel.name ?? "")
                .font(.title)
            AsyncImage(url: URL(string: "https://openweathermap.org/img/w/"+(cityWeatherModel.weather?.first?.icon ?? "")+".png")) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 150, height: 150)
            Text(String(format: "%.0f%@", cityWeatherModel.main?.temp ?? 0, "°"))
                .font(.title)
            Spacer()
            Text(String(format: "%@%.0f%@", "It feels like", cityWeatherModel.main?.feels_like ?? 0, "°"))
                .font(.title3)
            HStack(alignment: .center) {
                Text(String(format: "%@%.0f%@", "High: ", cityWeatherModel.main?.temp_max ?? 0, "°"))
                    .font(.title3)
                    .foregroundColor(.gray)
                Text(String(format: "%@%.0f%@", "Low: ", cityWeatherModel.main?.temp_min ?? 0, "°"))
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            Spacer()
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        }
        .padding()
       
    }
}

#Preview {
    CityWeatherDetailsView(model: CityWeather(name: "Paris"))
}

