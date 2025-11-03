//
//  File.swift
//  MyFavPlaces
//
//  Created by kpoznanski kpoznanski on 20/10/2025.
//

import Foundation
import SwiftData



enum PlaceType: String {
    case restauracja
    case kawiarnia
    case pub
    case bar
    case oboz
}

@Model
class FavouritePlace: Identifiable {
    var id = UUID()
    var nazwa: String
    var typ: PlaceType
    var lokalizacja: String
    var opis: String
    var logoURL: URL?
    var zdjecieWTleURL: URL?
    var ulubiony: Bool
    var odwiedzony: Bool
    
    init(
    nazwa: String,
    typ: PlaceType,
    lokalizacja: String,
    opis: String,
    logoURL: URL?,
    zdjecieWTleURL: URL?,
    ulubiony: Bool,
    odwiedzony: Bool){
        self.nazwa = nazwa
        self.typ = typ
        self.lokalizacja = lokalizacja
        self.opis = opis
        self.logoURL = logoURL
        self.zdjecieWTleURL = zdjecieWTleURL
        self.ulubiony = ulubiony
        self.odwiedzony = odwiedzony
    }
}



//Utwórz strukturę o nazwie FavouritePlace, modelującej pojedyncze miejsce. Model powinien zawierać następujące pola:
//
//nazwę,
//typ miejsca (np. restauracja, kawiarnia, pub itp.) – wraz z definicją odpowiedniego enumeracyjnego typu danych,
//lokalizację (dzielnicę/miasto),
//opis,
//URL logo – jako odpowiedni typ danych (może być nil),
//URL zdjęcia w tle – jako odpowiedni typ danych (może być nil),
//ulubiony – flaga,
//odwiedzony – flaga.
