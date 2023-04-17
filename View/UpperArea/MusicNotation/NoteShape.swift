//
//  NoteShape.swift
//  
//
//  Created by Henri Bredt on 17.04.23.
//

import SwiftUI

struct NoteShape: Shape {
    let helpLine: Bool
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.496*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.896*width, y: 0.5*height), control1: CGPoint(x: 0.71691*width, y: 0), control2: CGPoint(x: 0.896*width, y: 0.22386*height))
        path.addCurve(to: CGPoint(x: 0.496*width, y: height), control1: CGPoint(x: 0.896*width, y: 0.77614*height), control2: CGPoint(x: 0.71691*width, y: height))
        path.addCurve(to: CGPoint(x: 0.096*width, y: 0.5*height), control1: CGPoint(x: 0.27509*width, y: height), control2: CGPoint(x: 0.096*width, y: 0.77614*height))
        path.addCurve(to: CGPoint(x: 0.496*width, y: 0), control1: CGPoint(x: 0.096*width, y: 0.22386*height), control2: CGPoint(x: 0.27509*width, y: 0))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.41812*width, y: 0.1437*height))
        path.addCurve(to: CGPoint(x: 0.35006*width, y: 0.58978*height), control1: CGPoint(x: 0.33886*width, y: 0.19328*height), control2: CGPoint(x: 0.30839*width, y: 0.393*height))
        path.addCurve(to: CGPoint(x: 0.56903*width, y: 0.8563*height), control1: CGPoint(x: 0.39173*width, y: 0.78656*height), control2: CGPoint(x: 0.48977*width, y: 0.90588*height))
        path.addCurve(to: CGPoint(x: 0.63709*width, y: 0.41022*height), control1: CGPoint(x: 0.64829*width, y: 0.80672*height), control2: CGPoint(x: 0.67876*width, y: 0.607*height))
        path.addCurve(to: CGPoint(x: 0.41812*width, y: 0.1437*height), control1: CGPoint(x: 0.59542*width, y: 0.21344*height), control2: CGPoint(x: 0.49739*width, y: 0.09412*height))
        path.closeSubpath()
        if helpLine {
            path.addRect(CGRect(x: 0, y: 0.43448*height, width: width, height: 0.12414*height))
        }
        return path
    }
}

