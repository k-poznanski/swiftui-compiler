


import SwiftUI
import SwiftData

enum PlacesFilter {
    case all, visited, favorites
}

struct ListOfPlaces: View{
    @Environment(\.modelContext) private var context
    var filter: PlacesFilter = .all

    @State private var selectedPlace: FavouritePlace?
    
    @Query private var allPlaces: [FavouritePlace]

    private var filteredPlaces: [FavouritePlace] {
        switch filter {
        case .all:
            return allPlaces
        case .visited:
            return allPlaces.filter { $0.odwiedzony }
        case .favorites:
            return allPlaces.filter { $0.ulubiony }
        }
    }

    private var navTitle: String {
        switch filter {
        case .all: return "Wszystkie"
        case .visited: return "Odwiedzone"
        case .favorites: return "Ulubione"
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(filteredPlaces) { place in
                    PlaceCard(place: place)
                        .onTapGesture {
                            selectedPlace = place
                        }
                }
            }
            .navigationTitle(navTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addNewPlace) {
                        Image(systemName: "plus")
                    }
                }
            }
        } detail: {
            if let place = selectedPlace {
                VStack {
                    Spacer()
                    Text(place.nazwa)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            } else {
                VStack {
                    Spacer()
                    Text("Wybierz miejsce")
                        .foregroundStyle(.secondary)
                    Spacer()
                }
            }
        }
        .task {
            if allPlaces.isEmpty {
                for place in favouritePlaces {
                    context.insert(place)
                }
            }
            
            // ensure selection is non-nil on compact devices if we have items
            if selectedPlace == nil, let first = filteredPlaces.first {
                selectedPlace = first
            }
        }
    }

    private func addNewPlace() {
        let newPlace = FavouritePlace(
            nazwa: "Nowe miejsce",
            typ: .restauracja,
            lokalizacja: "",
            opis: "",
            logoURL: nil,
            zdjecieWTleURL: nil,
            ulubiony: (filter == .favorites),
            odwiedzony: (filter == .visited) || (filter == .favorites)
        )
        context.insert(newPlace)
        selectedPlace = newPlace
    }
}

#Preview {
    ListOfPlaces()
}


