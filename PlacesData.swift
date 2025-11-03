import Foundation

let favouritePlaces: [FavouritePlace] = [
    FavouritePlace(
        nazwa: "Stary Oboz",
        typ: .oboz,
        lokalizacja:"gornicza dolina",
        opis: "To jest stary oboz w koloni",
        logoURL: URL(string:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3wzoJYkHXeEDNmWHkbZ7UaHPVh635W5N0B1mKAPcT6Exrx1P2UJLQePc16iVpsZPjCW4&usqp=CAU"),
        zdjecieWTleURL: URL(string:"https://i.ytimg.com/vi/EV_X5Ncch3A/sddefault.jpg"),
        ulubiony: true,
        odwiedzony: false
    ),
    FavouritePlace(
        nazwa: "Klub Studio",
        typ: .restauracja,
        lokalizacja: "Kraków",
        opis: "Przytulna restauracja z kuchnią polską.",
        logoURL: URL(string: "https://home.agh.edu.pl/~psokolow/pum/klub-studio-logo.png"),
        zdjecieWTleURL: URL(string: "https://home.agh.edu.pl/~psokolow/pum/klub-studio-bg.jpg"),
        ulubiony: true,
        odwiedzony: true
    ),
    FavouritePlace(
        nazwa: "Kawiarnia Centralna",
        typ: .kawiarnia,
        lokalizacja: "Warszawa",
        opis: "Miejsce na relaks z kawą i deserami.",
        logoURL: nil,
        zdjecieWTleURL: nil,
        ulubiony: false,
        odwiedzony: true
    ),
    FavouritePlace(
        nazwa: "Pub Pod Aniołami",
        typ: .pub,
        lokalizacja: "Gdańsk",
        opis: "Tradycyjny pub z piwem kraftowym.",
        logoURL: nil,
        zdjecieWTleURL: nil,
        ulubiony: true,
        odwiedzony: false
    ),
    FavouritePlace(
        nazwa: "Restauracja Włoska",
        typ: .restauracja,
        lokalizacja: "Poznań",
        opis: "Autentyczna kuchnia włoska.",
        logoURL: nil,
        zdjecieWTleURL: nil,
        ulubiony: false,
        odwiedzony: false
    ),
    FavouritePlace(
        nazwa: "Kawiarnia Literacka",
        typ: .kawiarnia,
        lokalizacja: "Wrocław",
        opis: "Kawiarnia z książkami i muzyką.",
        logoURL: nil,
        zdjecieWTleURL: nil,
        ulubiony: true,
        odwiedzony: true
    )
]
