import SwiftUI

/// sits right above the keyboard, features resizing buttons and product labels
struct AboveKeyboardButtonBar: View {
    let geo: GeometryProxy
    @Binding var sizeDivisor: CGFloat // required for childs
    
    var body: some View {
        HStack(spacing: 10){
            VStack(alignment: .leading, spacing: 3){
                Text("ePianighi \"Craig 23\"").bold()
                Text("Educational E-Piano")
            }
            .font(.system(.footnote, design: .monospaced))
            .foregroundColor(Color("DarkGray"))
            .padding(.leading)
            Spacer()
            
            AboveKeyboardButtonView(sizeDivisor: $sizeDivisor, icon: "info.circle") {
                AppState.shared.showKeyboardHelpLabels.toggle()
            }
    
            AboveKeyboardButtonView(sizeDivisor: $sizeDivisor, icon: "minus.magnifyingglass") {
                sizeDivisor += 0.5
            }
                .disabled(sizeDivisor >= 6.5)
            
            AboveKeyboardButtonView(sizeDivisor: $sizeDivisor, icon: "plus.magnifyingglass") {
                sizeDivisor -= 0.5
            }
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
