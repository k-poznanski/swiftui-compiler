//
//  MyFavPlacesApp.swift
//  MyFavPlaces
//
//  Created by kpoznanski kpoznanski on 08/10/2025.
//

import SwiftUI
import SwiftData

@main
struct MyFavPlacesApp: App {
    var body: some Scene {
        WindowGroup {
            MyTabView()
        }
        .modelContainer(for: [FavouritePlace.self])

        
    }
}
