//
//  TabView.swift
//  TriangleCalculator
//
//  Created by Kavindu Lakshan Jayathilake on 2023-03-22.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ContentView()
            .tabItem {
                Label("Calculation", systemImage: "sum")
            }
            HistoryView(altitude: "", base: "", hypotenuse: "", area: "", perimeter: "")
                .tabItem {
                    Label("History", systemImage: "list.dash")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {

    static var previews: some View {
        MainTabView()
    }
}
