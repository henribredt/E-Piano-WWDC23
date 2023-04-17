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
                                        VStack{
                                            Text("WELCOME")
                                                .font(.system(.body, design: .monospaced))
                                            Rectangle()
                                                .fill(Color("DarkGray"))
                                                .frame(maxWidth: .infinity, minHeight: 2, maxHeight: 2)
                                                
                                            Spacer()
                                            if appState.isOn {
                                                Text(appState.currentNote?.rawValue ?? "Play a note")
                                                    .font(.system(.body, design: .monospaced))
    
                                            }  else {
                                                Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla faciliss")
                                                    .font(.system(.body, design: .monospaced))
                                            }
                                            Spacer()
                                            
                                            
                                            HStack(spacing: 10){
                                                Text("Press")
                                                    .font(.system(.footnote, design: .monospaced))
                                                Text("OPTION 1")
                                                    .font(.system(.caption2, design: .monospaced, weight: .medium))
                                                    .padding(EdgeInsets(top: 3, leading: 9, bottom: 3, trailing: 9))
                                                    .overlay{
                                                        RoundedRectangle(cornerRadius: 100)
                                                            .stroke(Color("DarkGray"), lineWidth: 1.2)
                                                            
                                                    }
                                                Text("to start")
                                                    .font(.system(.footnote, design: .monospaced))
                                            }
                                        }
                                        .foregroundColor(Color("DarkGray"))
                                        .opacity(0.75)
                                        .shadow(color: .black.opacity(0.4), radius: 2, x: 2, y: 3)
                                        .padding(30)
                                    }
                                Spacer()
                            }
                            Spacer()
                            VStack(alignment: .leading, spacing: 30){
                                HStack{
                                    Button {
                                        if appState.isOn {
                                            SoundEngine.buttonSound()
                                        }
                                        appState.isOn.toggle()
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
                                                RoundedRectangle(cornerRadius: 100)
                                                    .frame(width: 55, height: 6)
                                                    .foregroundColor(appState.isOn ? .red.opacity(0.8) : .gray.opacity(0.9))
                                                    .shadow(color: .red.opacity(appState.isOn ? 0.8 : 0.0), radius: 3)
                                            }
                                    }
                                    Text("POWER")
                                        .font(.system(.footnote, design: .monospaced))
                                        .foregroundColor(Color("DarkGray"))
                                        .padding(.leading)
                                }
                                
                                
                                HStack{
                                    Button {
                                        //
                                        SoundEngine.buttonSound()
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
                                    }
                                    Text("OPTION 1")
                                        .font(.system(.footnote, design: .monospaced))
                                        .foregroundColor(Color("DarkGray"))
                                        .padding(.leading)
                                }
                                
                                HStack{
                                    Button {
                                        //
                                        SoundEngine.buttonSound()
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
                                    }
                                    Text("OPTION 2")
                                        .font(.system(.footnote, design: .monospaced))
                                        .foregroundColor(Color("DarkGray"))
                                        .padding(.leading)
                                }
                                
                                HStack{
                                    Button {
                                        //
                                        SoundEngine.buttonSound()
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
                                    }
                                    Text("INFO")
                                        .font(.system(.footnote, design: .monospaced))
                                        .foregroundColor(Color("DarkGray"))
                                        .padding(.leading)
                                }
                            }
                            Spacer()
                        }
                        .padding(.top)
                    }
                    
                }
                .padding(.bottom, 1)
                
                HStack(spacing: 10){
                    VStack(alignment: .leading, spacing: 3){
                        Text("Craig ePianighi 23").bold()
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
                            Image(systemName: "minus.magnifyingglass")
                                .foregroundColor(Color("DarkGray"))
                                .font(.title3)
                                .padding(EdgeInsets(top: 6, leading: 18, bottom: 6, trailing: 18))
                        )
                        .frame(width: 90)
                        .padding(.vertical, 10)
                        .padding(.trailing, 6)
                    }
                    .disabled(sizeDivisor >= 6.5)
                    
                    
                    Button {
                        sizeDivisor -= 0.5
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
                            Image(systemName: "plus.magnifyingglass")
                                .foregroundColor(Color("DarkGray"))
                                .font(.title3)
                                .padding(EdgeInsets(top: 6, leading: 18, bottom: 6, trailing: 18))
                        )
                        .frame(width: 90)
                        .padding(.vertical, 10)
                        .padding(.trailing, 6)
                    }
                    .disabled(sizeDivisor <= 4)
                    .padding(.trailing, 9)
                }
                .frame(width: geo.size.width, height: 60)
                .background(){
                    Rectangle()
                        .fill(Color("UIGray"))
                    
                        .shadow(color: .red.opacity(0.5), radius: 5, y: 10)
                        .zIndex(10)
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 3){
                        ForEach(Octave.allCases, id: \.self) { octave in
                            OctaveView(drawingHeight: geo.size.height/sizeDivisor*2, octave: octave)
                        }
                    }
                    .disabled(!appState.isOn)
                }
                .frame(width: geo.size.width, height: geo.size.height/sizeDivisor*2)
                .padding(.bottom, 24)
                .padding(.top, 3)
                .background{
                    Color.black
                }
            }
            .onChange(of: appState.isOn) { isOn in
                if isOn {
                    SoundEngine.playCelebration()
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
        @StateObject var appState = AppState()
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(appState)
    }
}
