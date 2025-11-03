//
//  SummaryView.swift
//  MyFavPlaces
//
//  Created by kpoznanski kpoznanski on 20/10/2025.
//

import SwiftUI
import SwiftData

struct SummaryView: View{
    @Query var favouritePlaces: [FavouritePlace]
    @Environment(\.modelContext) private var context
    
    var body: some View{
        VStack(alignment: .leading, spacing: 20) {
                let liczbaMiejsc = favouritePlaces.count
                let liczbaUlubionych = favouritePlaces.filter { $0.ulubiony }.count
                let liczbaOdwiedzonych = favouritePlaces.filter { $0.odwiedzony }.count
                
                Text("Podsumowanie")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()

                RoundedRectangle(cornerRadius: 12)
                    .fill(Color("RamkaColor").opacity(0.7))
                    .frame(height: 60)
                    .overlay(
                        Text("Skatalogowanych miejsc: \(liczbaMiejsc)")
                            .padding()
                    )
                    .padding(.horizontal)
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color("RamkaColor").opacity(0.7))
                    .frame(height: 60)
                    .overlay(
                        Text("Odwiedzone: \(liczbaOdwiedzonych)")
                            .padding()
                    )
                    .padding(.horizontal)
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color("RamkaColor").opacity(0.7))
                    .frame(height: 60)
                    .overlay(
                        Text("Ulubione: \(liczbaUlubionych)")
                            .padding()
                    )
                    .padding(.horizontal)
                
                Spacer()
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("GradientStart"),
                        Color("GradientEnd")
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .task {
                if favouritePlaces.isEmpty {
                    do {
                        try context.delete(model: FavouritePlace.self, where: #Predicate { _ in true })
                    } catch {
                        print("Failed to delete")
                    }
                    
                    for place in PlacesData.samplePlaces {
                        context.insert(place)
                    }
                }
            }
    }
}

#Preview {
    SummaryView()
        .modelContainer(for: [FavouritePlace.self])
}
