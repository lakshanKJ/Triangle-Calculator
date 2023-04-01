//
//  HistoryView.swift
//  TriangleCalculator
//
//  Created by Kavindu Lakshan Jayathilake on 2023-03-22.
//

import SwiftUI

struct HistoryView: View {
    
    @AppStorage("altitide-save") private var altitude = ""
    @AppStorage("base-save") private var base = ""
    @AppStorage("hypotenuse-save") private var hypotenuse = ""
    @AppStorage("area-save") private var area = ""
    @AppStorage("perimeter-save") private var perimeter = ""
    
//    @Binding var altitude: String
//    @EnvironmentObject var secondTabViewModel: SecondTabViewModel

    init(altitude: String?, base: String?, hypotenuse: String?, area: String?, perimeter: String?) {
//           self.historyList = historyList
        if !(altitude == "") {
            self.altitude = altitude ?? "NO VALUE"
            print("00000000: \(self.altitude)")
        }
        if !(base == "") {
            self.base = base ?? "NO VALUE"
        }
        if !(hypotenuse == "") {
            self.hypotenuse = hypotenuse ?? "NO VALUE"
        }
        if !(area == "") {
            self.area = area ?? "NO VALUE"
        }
        if !(perimeter == "") {
            self.perimeter = perimeter ?? "NO VALUE"
        }
       }
    
    var body: some View {
        
        
        NavigationView {
            
            VStack {
                
//                VStack {
//                    Button("Test") {
//                        print("-------altGlobal: \(altitudeGlobal)")
//                        print("-------alt: \(altitude)")
//                        altitude = altitudeGlobal
//                    }
//                }
                
                HStack{
                    VStack {
                        Text("Altitude: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Base: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Hypotenuse: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Area: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Perimeter: ")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    VStack {
                        Text("\(altitude)")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        Text("\(base)")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        Text("\(hypotenuse)")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        Text("\(area)")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        Text("\(perimeter)")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            .navigationTitle(Text("Last Calculation"))
        }
    }
//    func assignValues() {
//        altitude = altitudeGlobal
//    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
//        HistoryView(altitude: $altitude)
        HistoryView(altitude: "", base: "", hypotenuse: "", area: "", perimeter: "")
    }
}
