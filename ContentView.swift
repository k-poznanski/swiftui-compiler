//
//  ContentView.swift
//  MyFavPlaces
//
//  Created by kpoznanski kpoznanski on 08/10/2025.
//

import SwiftUI

struct ContentView: View {
    var place: FavouritePlace
    var body: some View {
        ScrollView{
            BackgroundImage(place: place).frame(height:300)
            CircleImage(place:place)
                .offset(y:-130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                
                Text(place.nazwa)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text("Ulubiony")
                    Text(place.typ.rawValue)
                }

                Divider()
                
                Text(place.lokalizacja)
                    .font(.title2)
                    .padding(.bottom, 2)
                
                Text(place.opis)
                    .font(.body)
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView(place: favouritePlaces[0])
}
