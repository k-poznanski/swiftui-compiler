//
//  CircleImage.swift
//  MyFavPlaces
//
//  Created by kpoznanski kpoznanski on 08/10/2025.
//
import SwiftUI
import Foundation
struct CircleImage: View{
    var place: FavouritePlace
    var body: some View {
        AsyncImage(url: place.logoURL){
            image in image
                .resizable()
                .frame(width: 260, height: 260)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4)
                )
                .shadow(radius: 7)
        }
        placeholder:{
            Image("PlaceLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 260, height: 260)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4)
                )
                .shadow(radius: 7)
        }
            
    }
}
#Preview {
    let place = favouritePlaces[0]
    
    CircleImage(place: place)
}
