import SwiftUI

/// sits right above the keyboard, features resizing buttons and product labels
struct AboveKeyboardButtonBar: View {
    let geo: GeometryProxy
    @Binding var sizeDivisor: CGFloat // required for childs
    
    var body: some View {
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 3){
                Text("Craig ePianighi 23").bold()
                Text("Educational E-Piano")
            }
            .font(.system(.footnote, design: .monospaced))
            .foregroundColor(Color("DarkGray"))
            .padding(.leading)
            Spacer()
    
            ResizingButtonView(isZoom: false, sizeDivisor: $sizeDivisor)
                .disabled(sizeDivisor >= 6.5)
            ResizingButtonView(isZoom: true, sizeDivisor: $sizeDivisor)
                .disabled(sizeDivisor <= 4)
                .padding(.trailing, 9)
        }
        .frame(width: geo.size.width, height: 60)
        .background(){
            Rectangle()
                .fill(Color("UIGray"))
                .shadow(color: .red.opacity(0.5), radius: 5, y: 10)
                .zIndex(1)
        }
    }
}
