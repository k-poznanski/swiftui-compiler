//
//  BackgroundImage.swift
//  MyFavPlaces
//
//  Created by kpoznanski kpoznanski on 08/10/2025.
//

import SwiftUI

struct BackgroundImage: View {
    var place: FavouritePlace
    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: place.zdjecieWTleURL){
                image in image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width)
                    .clipped()
            } placeholder: {
                Image("BG")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width)
                    .clipped()
                    .ignoresSafeArea()
                    
            }
                
        }
        .ignoresSafeArea()
    }
}
#Preview {
    let place = favouritePlaces[0]
    
    BackgroundImage(place: place)
}
