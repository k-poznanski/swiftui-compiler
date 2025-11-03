import SwiftUI
import AppKit
import Foundation

// Model dla testowych danych
enum PlaceType: String {
    case restauracja
    case kawiarnia
    case pub
    case bar
    case oboz
}

class FavouritePlace: Identifiable, ObservableObject {
    var id = UUID()
    var nazwa: String
    var typ: PlaceType
    var lokalizacja: String
    var opis: String
    var logoURL: URL?
    var zdjecieWTleURL: URL?
    @Published var ulubiony: Bool
    @Published var odwiedzony: Bool
    
    init(
        nazwa: String,
        typ: PlaceType,
        lokalizacja: String,
        opis: String,
        logoURL: URL?,
        zdjecieWTleURL: URL?,
        ulubiony: Bool,
        odwiedzony: Bool
    ){
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
    

    
// Testowy widok karty
struct PlaceCardPreview: View {
    @ObservedObject var place: FavouritePlace
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading) {
                    Text(place.nazwa)
                        .font(.headline)
                        .lineLimit(1)
                    Text(place.typ.rawValue.uppercased())
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                HStack(spacing: 8) {
                    if place.odwiedzony {
                        Image(systemName: "checkmark.square.fill")
                            .foregroundColor(.green)
                    }
                    if place.ulubiony {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
            
            Text(place.opis)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(2)
            
            HStack(spacing: 4) {
                Image(systemName: "mappin.circle.fill")
                    .font(.caption)
                Text(place.lokalizacja)
                    .font(.caption)
            }
            .foregroundColor(.blue)
        }
        .padding(12)
        .background(Color(.systemBackground))
        .border(Color.gray.opacity(0.3), width: 1)
        .cornerRadius(8)
    }
}

struct MainView: View {
    var body: some View {
        let testPlace = FavouritePlace(
            nazwa: "Stary Obóz",
            typ: .oboz,
            lokalizacja: "Górnisza Dolina",
            opis: "To jest stary obóz w koloni",
            logoURL: nil,
            zdjecieWTleURL: nil,
            ulubiony: true,
            odwiedzony: false
        )
        
        return PlaceCardPreview(place: testPlace)
    }
}


@main
struct RenderViewApp {
    static func main() {

        
        let contentView = MainView()
        
        let size = CGSize(width: 390, height: 200)
        
        let renderer = ImageRenderer(content: contentView)
        renderer.proposedSize = ProposedViewSize(size)


        
        renderer.scale = 3.0
        
        guard let nsImage = renderer.nsImage else {
            print("❌ Failed to render view to NSImage")
            exit(1)
        }
        
        guard let tiffData = nsImage.tiffRepresentation,
              let bitmapImage = NSBitmapImageRep(data: tiffData),
              let pngData = bitmapImage.representation(using: NSBitmapImageRep.FileType.png, properties: [:]) else {
            print("❌ Failed to convert image to PNG")
            exit(1)
        }
        
        let outputPath = "rendered-view.png"
        let fileURL = URL(fileURLWithPath: outputPath)
        
        do {
            try pngData.write(to: fileURL)
            print("✅ Successfully rendered TabView to: \(outputPath)")
            print("📊 Image size: \(Int(size.width))x\(Int(size.height)) @ \(renderer.scale)x scale")
            print("📱 Output resolution: \(Int(size.width * renderer.scale))x\(Int(size.height * renderer.scale)) pixels")
        } catch {
            print("❌ Failed to write image to file: \(error)")
            exit(1)
        }
    }
}