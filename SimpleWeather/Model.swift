//
//  Model.swift
//  SimpleWeather
//
//  Created by Ryan S on 6/23/24.
//

import Foundation

struct Weather: Codable {
    var location: Location
    var current: Current
    var forecast: Forecast
    
}

struct Location: Codable {
    var name: String
}

struct Current: Codable {
    var temp_f: Double
    var condition: Condition
    
}

struct Condition: Codable {
    var code: Int
    var text: String
}

struct Forecast: Codable {
    var forecastday: [ForecastDay]
}

struct ForecastDay: Codable {
    var day: Day
}

struct Day: Codable {
    var maxtemp_f: Double
    var mintemp_f: Double
}
