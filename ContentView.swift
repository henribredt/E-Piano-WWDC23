import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    @State private var sizeDivisor: CGFloat = 5
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0){
                ZStack(alignment: .center){
                    GeometryReader { upperGeo in
                        Rectangle()
                            .fill(Color("UIGray"))
                        
                        HStack{
                            Spacer()
                            VStack{
                                Spacer()
                                Rectangle()
                                    .fill(
                                        Color("DisplayColor")
                                            .shadow(.inner(radius: 2, x: 10, y: 15))
                                            .shadow(.inner(radius: 6, x: -1, y: -1))
                                        
                                    )
                                    .frame(width: geo.size.width/1.8, height: upperGeo.size.height/1.2)
                                    .cornerRadius(6)
                                    .shadow(radius: 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color("DarkGray"), lineWidth: 2)
                                        //.stroke(Color("UIGray"), lineWidth: 5)
                                    )
                                    .overlay{
                                        Text(appState.currentNote?.rawValue ?? "Play a note")
                                            .font(.system(.body, design: .monospaced))
                                            .foregroundColor(Color("DarkGray"))
                                            .opacity(0.8)
                                            .shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 3)
                                    }
                                Spacer()
                            }
                            Spacer()
                        }
                        .padding(.top)
                    }
                    
                }
                .padding(.bottom, 1)
                
                HStack(spacing: 16){
                    VStack(alignment: .leading, spacing: 3){
                        Text("Craig Pianighi 23").bold()
                        Text("Educational E-Piano")
                    }
                    .font(.system(.footnote, design: .monospaced))
                    .foregroundColor(Color("DarkGray"))
                    .padding(.leading)
                    Spacer()
                    Button {
                        sizeDivisor += 0.5
                        SoundEngine.buttonSound()
                    } label: {
                        Image(systemName: "minus.magnifyingglass")
                            .foregroundColor(Color("DarkGray").opacity(0.8))
                            .font(.title3)
                            .padding(EdgeInsets(top: 8, leading: 18, bottom: 8, trailing: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color("DarkGray"), lineWidth: 2)
                            )
                    }
                    .disabled(sizeDivisor >= 6.5)
                    
                    
                    Button {
                        sizeDivisor -= 0.5
                        SoundEngine.buttonSound()
                    } label: {
                        Image(systemName: "plus.magnifyingglass")
                            .foregroundColor(Color("DarkGray").opacity(0.8))
                            .font(.title3)
                            .padding(EdgeInsets(top: 8, leading: 18, bottom: 8, trailing: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color("DarkGray"), lineWidth: 2)
                            )
                    }
                    .disabled(sizeDivisor <= 4)
                    .padding(.trailing)
                }
                .frame(width: geo.size.width, height: 60)
                .background(){
                    Rectangle()
                        .fill(Color("UIGray"))
                    
                        .shadow(color: .red.opacity(0.8), radius: 5, y: 10)
                        .zIndex(10)
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 3){
                        ForEach(Octave.allCases, id: \.self) { octave in
                            OctaveView(drawingHeight: geo.size.height/sizeDivisor*2, octave: octave)
                        }
                    }
                    
                    
                }
                .frame(width: geo.size.width, height: geo.size.height/sizeDivisor*2)
                .padding(.bottom, 24)
                .padding(.top, 3)
                .background{
                    Color.black
                }
            }
            
        }
        .background{
            Color.black
        }
        .ignoresSafeArea()
    }
    
    var key: some View {
        Button {
            print("pressed")
        } label: {
            
            Image("KeyWhite_rightCutout")
                .resizable()
                .scaledToFit()
        }
        
    }
}

@available(iOS 16.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
