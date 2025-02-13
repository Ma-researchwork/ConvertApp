//
//  ContentView.swift
//  ConvertApp
//
//  Created by PengchongMa on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    @State private var fahrenheitValue: String = ""
    @State private var celsiusValue: String = ""
    @State private var inchesValue: String = ""
    @State private var centimetersValue: String = ""
    @State private var metersValue: String = ""
    @State private var feetValue: String = ""
    @State private var poundsValue: String = ""
    @State private var kilogramsValue: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("ConvertApp")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                // Fahrenheit to Celsius
                ConversionSection(
                    title: "Fahrenheit to Celsius",
                    inputValue: $fahrenheitValue,
                    convertAction: {
                        if let fahrenheit = Double(fahrenheitValue) {
                            let celsius = (fahrenheit - 32) * 5 / 9
                            return String(format: "%.2f °C", celsius)
                        }
                        return "Invalid input"
                    }
                )
                
                // Celsius to Fahrenheit
                ConversionSection(
                    title: "Celsius to Fahrenheit",
                    inputValue: $celsiusValue,
                    convertAction: {
                        if let celsius = Double(celsiusValue) {
                            let fahrenheit = (celsius * 9 / 5) + 32
                            return String(format: "%.2f °F", fahrenheit)
                        }
                        return "Invalid input"
                    }
                )
                
                // Inches to Centimeters
                ConversionSection(
                    title: "Inches to Centimeters",
                    inputValue: $inchesValue,
                    convertAction: {
                        if let inches = Double(inchesValue) {
                            let centimeters = inches * 2.54
                            return String(format: "%.2f cm", centimeters)
                        }
                        return "Invalid input"
                    }
                )
                
                // Centimeters to Inches
                ConversionSection(
                    title: "Centimeters to Inches",
                    inputValue: $centimetersValue,
                    convertAction: {
                        if let centimeters = Double(centimetersValue) {
                            let inches = centimeters / 2.54
                            return String(format: "%.2f in", inches)
                        }
                        return "Invalid input"
                    }
                )
                
                // Meters to Feet
                ConversionSection(
                    title: "Meters to Feet",
                    inputValue: $metersValue,
                    convertAction: {
                        if let meters = Double(metersValue) {
                            let feet = meters * 3.28084
                            return String(format: "%.2f ft", feet)
                        }
                        return "Invalid input"
                    }
                )
                
                // Feet to Meters
                ConversionSection(
                    title: "Feet to Meters",
                    inputValue: $feetValue,
                    convertAction: {
                        if let feet = Double(feetValue) {
                            let meters = feet / 3.28084
                            return String(format: "%.2f m", meters)
                        }
                        return "Invalid input"
                    }
                )
                
                // Pounds to Kilograms
                ConversionSection(
                    title: "Pounds to Kilograms",
                    inputValue: $poundsValue,
                    convertAction: {
                        if let pounds = Double(poundsValue) {
                            let kilograms = pounds * 0.453592
                            return String(format: "%.2f kg", kilograms)
                        }
                        return "Invalid input"
                    }
                )
                
                // Kilograms to Pounds
                ConversionSection(
                    title: "Kilograms to Pounds",
                    inputValue: $kilogramsValue,
                    convertAction: {
                        if let kilograms = Double(kilogramsValue) {
                            let pounds = kilograms / 0.453592
                            return String(format: "%.2f lb", pounds)
                        }
                        return "Invalid input"
                    }
                )
            }
            .padding()
        }
    }
}

struct ConversionSection: View {
    let title: String
    @Binding var inputValue: String
    let convertAction: () -> String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
            TextField("Enter value", text: $inputValue)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            Text("Converted Value: \(convertAction())")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

#Preview {
    ContentView()
}
