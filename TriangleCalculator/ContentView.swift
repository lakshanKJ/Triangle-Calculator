//
//  ContentView.swift
//  TriangleCalculator
//
//  Created by Kavindu Lakshan Jayathilake on 2023-03-21.
//

import SwiftUI

//class SecondTabViewModel: ObservableObject {
//    @Published var altitude: String = ""
//}



struct ContentView: View {
    
    @State var altitude = ""
    @State private var base = ""
    @State private var hypotenuse = ""
    
    @State private var area = ""
    @State private var perimeter = ""
    
    @State private var altitudeSelect = "Altitude value"
    @State private var baseSelect = "Base value"
    @State private var hypotenuseSelect = "Hypotenuse value"
    
    @State private var selection1 = ""
    @State private var selection2 = ""
    
    @State private var selection: String = "Altitude"
    
    @State var selectionTest: Int? = nil
    
//    @StateObject var secondTabViewModel = SecondTabViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                VStack {
                    Image("right_triangle")
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Text("Choose the \nunknown value")
                            .font(Font.body.weight(.bold))
                            .multilineTextAlignment(.leading)
                        Picker("Length", selection: $selection, content: {
                            Text("Altitude")
                                .bold()
                                .tag("Altitude")
                            Text("Base")
                                .bold()
                                .tag("Base")
                            Text("Hypotenuse")
                                .bold()
                                .tag("Hypotenuse")
                        })
                        .pickerStyle(.wheel)
                        .onChange(of: selection) {
                            tag in print("Unknown length: \(tag) ||Selection is: \(self.selection)")
                        }
                    }
                    
                    Text("Enter known length values")
                        .font(Font.body.weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    
                    if !(selection == "Altitude") { TextField(altitudeSelect, text: $altitude)
                            .padding(4)
                            .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke(Color(hue: 1.0, saturation: 0.028, brightness: 0.629), lineWidth: 2)
                            )
                    }
                    
                    if !(selection == "Base") {
                        TextField(baseSelect, text: $base)
                            .padding(4)
                            .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke(Color(hue: 1.0, saturation: 0.028, brightness: 0.629), lineWidth: 2)
                            )
                    }
                    
                    if !(selection == "Hypotenuse") {
                        TextField(hypotenuseSelect, text: $hypotenuse)
                            .padding(4)
                            .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke(Color(hue: 1.0, saturation: 0.028, brightness: 0.629), lineWidth: 2)
                            )
                    }
                    
                    NavigationLink(destination: HistoryView(altitude: altitude, base: base, hypotenuse: hypotenuse, area: area, perimeter: perimeter), tag: 1, selection: $selectionTest) {
                        
                        VStack{
                            Button("Calculate") {
                                //calculate unknown value, area and perimeter
//                                self.selectionTest = 1
                                
                                if selection == "Altitude" {
                                    let altitudeDouble = findA()
                                    let baseDouble = Double(base)
                                    let hypotenuseDouble = Double(hypotenuse)
                                    
                                    altitude = String(format: "%.2f", altitudeDouble)
                                    
                                    let areaDouble = findArea(a: altitudeDouble, b: baseDouble ?? 0)
                                    area = String(format: "%.2f", areaDouble)
                                    
                                    let perimeterDouble = findPerimeter(a: altitudeDouble, b: baseDouble ?? 0, c: hypotenuseDouble ?? 0)
                                    perimeter = String(format: "%.2f", perimeterDouble)
                                }
                                
                                if selection == "Base" {
                                    let altitudeDouble = Double(altitude)
                                    let baseDouble = findB()
                                    let hypotenuseDouble = Double(hypotenuse)
                                    base = String(format: "%.2f", baseDouble)
                                    
                                    let areaDouble = findArea(a: altitudeDouble ?? 0, b: baseDouble)
                                    area = String(format: "%.2f", areaDouble)
                                    
                                    let perimeterDouble = findPerimeter(a: altitudeDouble ?? 0, b: baseDouble, c: hypotenuseDouble ?? 0)
                                    perimeter = String(format: "%.2f", perimeterDouble)
                                }
                                if selection == "Hypotenuse" {
                                    let altitudeDouble = Double(altitude)
                                    let baseDouble = Double(base)
                                    let hypotenuseDouble = findC()
                                    hypotenuse = String(format: "%.2f", hypotenuseDouble)
                                    
                                    let areaDouble = findArea(a: altitudeDouble ?? 0, b: baseDouble ?? 0)
                                    area = String(format: "%.2f", areaDouble)
                                    
                                    let perimeterDouble = findPerimeter(a: altitudeDouble ?? 0, b: baseDouble ?? 0, c: hypotenuseDouble)
                                    perimeter = String(format: "%.2f", perimeterDouble)
                                }
                                
                                self.selectionTest = 1
                            }
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 6)
                                .stroke(Color(hue: 1.0, saturation: 0.028, brightness: 0.629), lineWidth: 2)
                            )
                            .font(Font.body.weight(.bold))
                            .foregroundColor(.white)
                            .background(Color.green)
                            
                            HStack{
                                VStack {
                                    Text("Hypotenuse: ")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("Area: ")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("Perimeter: ")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                VStack {
                                    Text("\(hypotenuse)")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    Text("\(area)")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    Text("\(perimeter)")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            }
                        }
                    }//close navLink
                }
                
                .navigationTitle(Text("Triangle Calculator"))
                .padding()
            }
        }
    }
    
    func findA() -> Double {
        if let b = Double(base),
           let c = Double(hypotenuse) {
            let firstStep = (pow(c, 2) - pow(b, 2))
            let secondStep = sqrt(firstStep)
            return secondStep
        } else { return 0 }
    }
    
    func findB() -> Double {
        if let a = Double(altitude),
           let c = Double(hypotenuse) {
            let firstStep = (pow(c, 2) - pow(a, 2))
            let secondStep = sqrt(firstStep)
            return secondStep
        } else { return 0 }
    }
    
    func findC() -> Double {
        if let a = Double(altitude),
           let b = Double(base) {
            let firstStep = (pow(a, 2) + pow(b, 2))
            let secondStep = sqrt(firstStep)
            return secondStep
        } else { return 0 }
    }
    
    func findArea(a:Double, b:Double) -> Double {
        let area = (a * b)/2
        return area
    }
    
    func findPerimeter(a:Double, b:Double, c:Double) -> Double {
        let firstStep = a + b + c
        return firstStep
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
