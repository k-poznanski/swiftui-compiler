import SwiftUI
import AppKit
import Foundation

struct MainView: View {
    var body: some View {
        Text("Hello, World!")
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