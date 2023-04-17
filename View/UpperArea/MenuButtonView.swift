import SwiftUI

struct MenuButtonView: View {
    let label: String
    let isPowerButton: Bool
    let action: () -> ()
   
    var body: some View {
        HStack{
            Button {
                action()
            } label: {
                Rectangle()
                    .fill(LinearGradient(
                        gradient: .init(colors: [Color.white, Color("UIGray")]),
                        startPoint: .init(x: 0.5, y: 0),
                        endPoint: .init(x: 0.5, y: 0.6)
                    ))
                    .cornerRadius(100)
                    .frame(width: 90, height: 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(Color("DarkGray"), lineWidth: 2)
                    )
                    .overlay {
                        if isPowerButton {
                            RoundedRectangle(cornerRadius: 100)
                            .frame(width: 55, height: 6)
                            .foregroundColor(AppState.shared.isOn ? .red.opacity(0.8) : .gray.opacity(0.9))
                            .shadow(color: .red.opacity(AppState.shared.isOn ? 0.8 : 0.0), radius: 3)
                        }
                    }
            }
            Text(label.uppercased())
                .font(.system(.footnote, design: .monospaced))
                .foregroundColor(Color("DarkGray"))
                .padding(.leading)
        }
    }
}
