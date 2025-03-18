//
//  ContentView.swift
//  ConvertApp
//
//  Created by PengchongMa on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    // Temperature States
    @State private var fahrenheitValue: String = ""
    @State private var celsiusValue: String = ""
    @State private var celsiusToKelvinValue: String = ""
    @State private var fahrenheitToKelvinValue: String = ""
    @State private var kelvinValue1: String = ""
    @State private var kelvinValue2: String = ""

    // Length States
    @State private var inchesValue: String = ""
    @State private var centimetersValue: String = ""
    @State private var metersValue: String = ""
    @State private var feetValue: String = ""

    // Weight States
    @State private var poundsValue: String = ""
    @State private var kilogramsValue: String = ""

    // Volume States
    @State private var litersValue: String = ""
    @State private var gallonsValue: String = ""

    // Disclosure toggles
    @State private var showTemperature = true
    @State private var showLength = false
    @State private var showWeight = false
    @State private var showVolume = false

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("ConvertApp")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                // 🔥 Temperature Section
                DisclosureGroup("🔥 Temperature", isExpanded: $showTemperature) {
                    Group {
                        ConversionSection(title: "Fahrenheit to Celsius", inputValue: $fahrenheitValue) {
                            if let fahrenheit = Double(fahrenheitValue) {
                                let celsius = (fahrenheit - 32) * 5 / 9
                                return String(format: "%.2f °C", celsius)
                            }
                            return "Invalid input"
                        }

                        ConversionSection(title: "Celsius to Fahrenheit", inputValue: $celsiusValue) {
                            if let celsius = Double(celsiusValue) {
                                let fahrenheit = (celsius * 9 / 5) + 32
                                return String(format: "%.2f °F", fahrenheit)
                            }
                            return "Invalid input"
                        }

                        ConversionSection(title: "Celsius to Kelvin", inputValue: $celsiusToKelvinValue) {
                            if let celsius = Double(celsiusToKelvinValue) {
                                let kelvin = celsius + 273.15
                                return String(format: "%.2f K", kelvin)
                            }
                            return "Invalid input"
                        }

                        ConversionSection(title: "Fahrenheit to Kelvin", inputValue: $fahrenheitToKelvinValue) {
                            if let fahrenheit = Double(fahrenheitToKelvinValue) {
                                let kelvin = (fahrenheit - 32) * 5 / 9 + 273.15
                                return String(format: "%.2f K", kelvin)
                            }
                            return "Invalid input"
                        }

                        ConversionSection(title: "Kelvin to Celsius", inputValue: $kelvinValue1) {
                            if let kelvin = Double(kelvinValue1) {
                                let celsius = kelvin - 273.15
                                return String(format: "%.2f °C", celsius)
                            }
                            return "Invalid input"
                        }

                        ConversionSection(title: "Kelvin to Fahrenheit", inputValue: $kelvinValue2) {
                            if let kelvin = Double(kelvinValue2) {
                                let fahrenheit = (kelvin - 273.15) * 9 / 5 + 32
                                return String(format: "%.2f °F", fahrenheit)
                            }
                            return "Invalid input"
                        }
                    }
                }

                // 📏 Length Section
                DisclosureGroup("📏 Length", isExpanded: $showLength) {
                    Group {
                        ConversionSection(title: "Inches to Centimeters", inputValue: $inchesValue) {
                            if let inches = Double(inchesValue) {
                                let centimeters = inches * 2.54
                                return String(format: "%.2f cm", centimeters)
                            }
                            return "Invalid input"
                        }

                        ConversionSection(title: "Centimeters to Inches", inputValue: $centimetersValue) {
                            if let centimeters = Double(centimetersValue) {
                                let inches = centimeters / 2.54
                                return String(format: "%.2f in", inches)
                            }
                            return "Invalid input"
                        }

                        ConversionSection(title: "Meters to Feet", inputValue: $metersValue) {
                            if let meters = Double(metersValue) {
                                let feet = meters * 3.28084
                                return String(format: "%.2f ft", feet)
                            }
                            return "Invalid input"
                        }

                        ConversionSection(title: "Feet to Meters", inputValue: $feetValue) {
                            if let feet = Double(feetValue) {
                                let meters = feet / 3.28084
                                return String(format: "%.2f m", meters)
                            }
                            return "Invalid input"
                        }
                    }
                }

                // ⚖️ Weight Section
                DisclosureGroup("⚖️ Weight", isExpanded: $showWeight) {
                    Group {
                        ConversionSection(title: "Pounds to Kilograms", inputValue: $poundsValue) {
                            if let pounds = Double(poundsValue) {
                                let kilograms = pounds * 0.453592
                                return String(format: "%.2f kg", kilograms)
                            }
                            return "Invalid input"
                        }

                        ConversionSection(title: "Kilograms to Pounds", inputValue: $kilogramsValue) {
                            if let kilograms = Double(kilogramsValue) {
                                let pounds = kilograms / 0.453592
                                return String(format: "%.2f lb", pounds)
                            }
                            return "Invalid input"
                        }
                    }
                }

                // 🧪 Volume Section
                DisclosureGroup("🧪 Volume", isExpanded: $showVolume) {
                    Group {
                        ConversionSection(title: "Liters to Gallons", inputValue: $litersValue) {
                            if let liters = Double(litersValue) {
                                let gallons = liters * 0.264172
                                return String(format: "%.2f gal", gallons)
                            }
                            return "Invalid input"
                        }

                        ConversionSection(title: "Gallons to Liters", inputValue: $gallonsValue) {
                            if let gallons = Double(gallonsValue) {
                                let liters = gallons / 0.264172
                                return String(format: "%.2f L", liters)
                            }
                            return "Invalid input"
                        }
                    }
                }
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
