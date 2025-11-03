//
//  PlaceCard.swift
//  MyFavPlaces
//
//  Created by kpoznanski kpoznanski on 20/10/2025.
//

import SwiftUI
import SwiftData

struct PlaceCard : View{
    @Bindable var place: FavouritePlace
    @Environment(\.modelContext) private var context

    var body : some View{
        HStack(spacing: 12) {
            // visited checkbox
            CheckBoxView(isOn: $place.odwiedzony, checkedIcon: "checkmark.square.fill", uncheckedIcon: "square")
                .onTapGesture {
                    withAnimation {
                        place.odwiedzony.toggle()
                    }
                    do {
                        try context.save()
                    } catch {
                        // ignore save errors for now
                    }
                }

            // favorite checkbox
            CheckBoxView(isOn: $place.ulubiony, checkedIcon: "star.fill", uncheckedIcon: "star")
                .onTapGesture {
                    withAnimation {
                        place.ulubiony.toggle()
                    }
                    do {
                        try context.save()
                    } catch {
                        // ignore save errors for now
                    }
                }

            VStack(alignment: .leading) {
                Text(place.nazwa)
                    .font(.headline)
                HStack {
                    Text(place.typ.rawValue)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(place.lokalizacja)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    let place = favouritePlaces[0]
    PlaceCard(place: place)
        .modelContainer(for: [FavouritePlace.self])
}
