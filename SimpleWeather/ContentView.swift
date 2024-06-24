//
//  ContentView.swift
//  SimpleWeather
//
//  Created by Ryan S on 6/23/24.
//

import SwiftUI

struct ContentView: View {
    @State var location: String = ""
    @State var currentTemp: Int = 0
    @State var emoji: String = "☀️"
    @State var description: String = ""
    @State var high: Int = 0
    @State var low: Int = 0
    @State var backgroundColor: Color = .white
    @State var loading: Bool = true
    
    var body: some View {
        VStack {
            if loading {
                ProgressView()
            } else {
                WeatherBoxView(location: $location, temp: $currentTemp, emoji: $emoji, description: $description, high: $high, low: $low, backgroundColor: $backgroundColor)
            }
            
        }
        .padding()
        .task {
            do {
                try await fetchApi()
            } catch {
                print("error calling function in task")
            }
        }
    }
    
    func fetchApi() async throws {
        
        let endpoint = "http://api.weatherapi.com/v1/forecast.json?key=97c2cdbbe41645f6a6e213011242206&q=92646&days=3&aqi=no&alerts=no"
        
        guard let url = URL(string: endpoint)
        else {
            print("Invalid URL")
            return
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(Weather.self, from: data)

        location = decoded.location.name
        currentTemp = Int(decoded.current.temp_f)
        emoji = getWeatherEmoji(code: decoded.current.condition.code)
        description = decoded.current.condition.text
        high = Int(decoded.forecast.forecastday[0].day.maxtemp_f)
        low = Int(decoded.forecast.forecastday[0].day.mintemp_f)
        backgroundColor = getBackgroundColor(code: decoded.current.condition.code)
        loading = false
        
        
        
        
    }
}

#Preview {
    ContentView()
}
