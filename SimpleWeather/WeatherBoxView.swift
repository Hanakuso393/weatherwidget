//
//  WeatherBoxView.swift
//  SimpleWeather
//
//  Created by Ryan S on 6/23/24.
//

import SwiftUI

struct WeatherBoxView: View {
    @Binding var location: String
    @Binding var temp: Int
    @Binding var emoji: String
    @Binding var description: String
    @Binding var high: Int
    @Binding var low: Int
    @Binding var backgroundColor: Color
    var body: some View {
        

        VStack (alignment: .leading) {

            Text(location)
                .font(.system(size: 25).bold())
                .padding(.top)
                .foregroundColor(.white)
                

            Text("\(temp)°F")
                .font(.system(size: 55))
                .foregroundColor(.white)
            
            Spacer()
            
            Text("\(emoji)")
                .font(.system(size: 30))
                
            Text(description)
                .font(.system(size: 25))
                .foregroundColor(.white)
            Text("H:\(high)° L:\(low)°")
                .font(.system(size: 25))
                .foregroundColor(.white)
                .padding(.bottom)
                

        }
        .frame(width: 250, height: 250)
        .background(
            backgroundColor
            )
        .cornerRadius(20)
        .padding()
        

    }
}

//#Preview {
//    WeatherBoxView()
//}
