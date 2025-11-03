//
//  TabView.swift
//  MyFavPlaces
//
//  Created by kpoznanski kpoznanski on 20/10/2025.
//

import SwiftUI
import SwiftData

struct MyTabView: View {
    var body: some View {
        TabView {
            Tab("Podsumowanie", systemImage: "chart.bar.fill"){
                SummaryView()
            }

            Tab("Wszystkie", systemImage: "list.bullet") {
                ListOfPlaces(filter: .all)
            }

            Tab("Odwiedzone", systemImage: "mappin.circle.fill"){
                ListOfPlaces(filter: .visited)
            }

            Tab("Ulubione", systemImage: "star.fill") {
                ListOfPlaces(filter: .favorites)
                    .badge(2)
            }
        }
    }
}

#Preview {
    MyTabView()
        .modelContainer(for: [FavouritePlace.self])
}
