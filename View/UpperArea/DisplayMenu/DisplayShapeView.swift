//
//  SwiftUIView 2.swift
//  
//
//  Created by Henri Bredt on 17.04.23.
//

import SwiftUI

@available(iOS 16.0, *)
struct DisplayShapeView: View {
    let geo: GeometryProxy
    let upperGeo: GeometryProxy
    
    var body: some View {
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
            )
    }
}
