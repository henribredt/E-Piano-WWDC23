import SwiftUI

struct ResizingButtonView: View {
    let isZoom: Bool
    @Binding var sizeDivisor: CGFloat
    
    var body: some View {
        Button {
            if isZoom {
                sizeDivisor -= 0.5
            } else {
                sizeDivisor += 0.5
            }
            SoundEngine.buttonSound()
                
        } label: {
            Rectangle()
                .fill(LinearGradient(
                    gradient: .init(colors: [Color.white, Color("UIGray")]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 0.6)
                ))
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("DarkGray"), lineWidth: 2)
                )
                .overlay(
                    Image(systemName: isZoom ? "plus.magnifyingglass" : "plus.magnifyingglass")
                        .foregroundColor(Color("DarkGray"))
                        .font(.title3)
                        .padding(EdgeInsets(top: 6, leading: 18, bottom: 6, trailing: 18))
                )
                .frame(width: 90)
                .padding(.vertical, 10)
                .padding(.trailing, 6)
        }
    }
}
