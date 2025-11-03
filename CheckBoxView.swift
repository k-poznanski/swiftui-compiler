import SwiftUI

struct CheckBoxView: View {
    @Binding var isOn: Bool
    var checkedIcon: String
    var uncheckedIcon: String
    var body: some View {
        Image(systemName: isOn ? checkedIcon : uncheckedIcon)
            .font(.title2)
            .foregroundColor(isOn ? .yellow : .secondary)
    }
}

#Preview {
    VStack(spacing: 20) {
        CheckBoxView(isOn: .constant(true), checkedIcon: "checkmark.square.fill", uncheckedIcon: "square")
        CheckBoxView(isOn: .constant(false), checkedIcon: "star.fill", uncheckedIcon: "star")
    }
}