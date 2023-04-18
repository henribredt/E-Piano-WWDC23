
// created with https://svg-to-swiftui.quassum.com/

import SwiftUI

struct ViolinClefShape: Shape {
    func path(in rect: CGRect) -> Path {
            var path = Path()
            let width = rect.size.width
            let height = rect.size.height
            path.move(to: CGPoint(x: 0.37481*width, y: 0.79868*height))
            path.addCurve(to: CGPoint(x: 0.43958*width, y: 0.85105*height), control1: CGPoint(x: 0.37481*width, y: 0.82131*height), control2: CGPoint(x: 0.41129*width, y: 0.84727*height))
            path.addCurve(to: CGPoint(x: 0.49472*width, y: 0.85211*height), control1: CGPoint(x: 0.43958*width, y: 0.85105*height), control2: CGPoint(x: 0.46983*width, y: 0.85638*height))
            path.addCurve(to: CGPoint(x: 0.57619*width, y: 0.77158*height), control1: CGPoint(x: 0.49922*width, y: 0.85283*height), control2: CGPoint(x: 0.57468*width, y: 0.84305*height))
            path.addLine(to: CGPoint(x: 0.56027*width, y: 0.68459*height))
            path.addCurve(to: CGPoint(x: 0.61617*width, y: 0.66703*height), control1: CGPoint(x: 0.57088*width, y: 0.68331*height), control2: CGPoint(x: 0.60549*width, y: 0.67152*height))
            path.addCurve(to: CGPoint(x: 0.66972*width, y: 0.62383*height), control1: CGPoint(x: 0.64548*width, y: 0.65474*height), control2: CGPoint(x: 0.65831*width, y: 0.63697*height))
            path.addCurve(to: CGPoint(x: 0.69009*width, y: 0.56914*height), control1: CGPoint(x: 0.68255*width, y: 0.6041*height), control2: CGPoint(x: 0.69009*width, y: 0.59062*height))
            path.addCurve(to: CGPoint(x: 0.55099*width, y: 0.47075*height), control1: CGPoint(x: 0.69009*width, y: 0.5148*height), control2: CGPoint(x: 0.62781*width, y: 0.47075*height))
            path.addCurve(to: CGPoint(x: 0.51883*width, y: 0.47341*height), control1: CGPoint(x: 0.53992*width, y: 0.47075*height), control2: CGPoint(x: 0.52916*width, y: 0.47168*height))
            path.addLine(to: CGPoint(x: 0.5051*width, y: 0.4036*height))
            path.addCurve(to: CGPoint(x: 0.62748*width, y: 0.26647*height), control1: CGPoint(x: 0.55708*width, y: 0.36274*height), control2: CGPoint(x: 0.60978*width, y: 0.3125*height))
            path.addCurve(to: CGPoint(x: 0.59052*width, y: 0.147*height), control1: CGPoint(x: 0.64483*width, y: 0.20567*height), control2: CGPoint(x: 0.63653*width, y: 0.1646*height))
            path.addCurve(to: CGPoint(x: 0.46681*width, y: 0.2398*height), control1: CGPoint(x: 0.54827*width, y: 0.14006*height), control2: CGPoint(x: 0.497*width, y: 0.18087*height))
            path.addCurve(to: CGPoint(x: 0.4834*width, y: 0.35608*height), control1: CGPoint(x: 0.44719*width, y: 0.27127*height), control2: CGPoint(x: 0.47218*width, y: 0.33139*height))
            path.addCurve(to: CGPoint(x: 0.30991*width, y: 0.54946*height), control1: CGPoint(x: 0.40071*width, y: 0.41213*height), control2: CGPoint(x: 0.31845*width, y: 0.45232*height))
            path.addCurve(to: CGPoint(x: 0.50463*width, y: 0.68718*height), control1: CGPoint(x: 0.30991*width, y: 0.62553*height), control2: CGPoint(x: 0.39709*width, y: 0.68718*height))
            path.addCurve(to: CGPoint(x: 0.55119*width, y: 0.68559*height), control1: CGPoint(x: 0.51491*width, y: 0.68718*height), control2: CGPoint(x: 0.53188*width, y: 0.68735*height))
            path.addLine(to: CGPoint(x: 0.56027*width, y: 0.77245*height))
            path.addCurve(to: CGPoint(x: 0.49537*width, y: 0.84459*height), control1: CGPoint(x: 0.56027*width, y: 0.77245*height), control2: CGPoint(x: 0.56376*width, y: 0.83598*height))
            path.addCurve(to: CGPoint(x: 0.44958*width, y: 0.83926*height), control1: CGPoint(x: 0.46823*width, y: 0.84801*height), control2: CGPoint(x: 0.44205*width, y: 0.85196*height))
            path.addCurve(to: CGPoint(x: 0.49537*width, y: 0.79868*height), control1: CGPoint(x: 0.47073*width, y: 0.83147*height), control2: CGPoint(x: 0.49537*width, y: 0.81905*height))
            path.addCurve(to: CGPoint(x: 0.4351*width, y: 0.75277*height), control1: CGPoint(x: 0.49537*width, y: 0.77333*height), control2: CGPoint(x: 0.46838*width, y: 0.75277*height))
            path.addCurve(to: CGPoint(x: 0.37481*width, y: 0.79868*height), control1: CGPoint(x: 0.4018*width, y: 0.75277*height), control2: CGPoint(x: 0.37481*width, y: 0.77333*height))
            path.closeSubpath()
            path.move(to: CGPoint(x: 0.49707*width, y: 0.4099*height))
            path.addLine(to: CGPoint(x: 0.50988*width, y: 0.47512*height))
            path.addCurve(to: CGPoint(x: 0.41191*width, y: 0.56914*height), control1: CGPoint(x: 0.45314*width, y: 0.48752*height), control2: CGPoint(x: 0.41191*width, y: 0.52493*height))
            path.addCurve(to: CGPoint(x: 0.49421*width, y: 0.63063*height), control1: CGPoint(x: 0.41191*width, y: 0.61917*height), control2: CGPoint(x: 0.4965*width, y: 0.6425*height))
            path.addCurve(to: CGPoint(x: 0.44901*width, y: 0.58225*height), control1: CGPoint(x: 0.46123*width, y: 0.62057*height), control2: CGPoint(x: 0.44901*width, y: 0.60926*height))
            path.addCurve(to: CGPoint(x: 0.51845*width, y: 0.51877*height), control1: CGPoint(x: 0.44901*width, y: 0.55172*height), control2: CGPoint(x: 0.47852*width, y: 0.52607*height))
            path.addLine(to: CGPoint(x: 0.54891*width, y: 0.67404*height))
            path.addCurve(to: CGPoint(x: 0.52666*width, y: 0.67735*height), control1: CGPoint(x: 0.54206*width, y: 0.67535*height), control2: CGPoint(x: 0.53467*width, y: 0.67646*height))
            path.addCurve(to: CGPoint(x: 0.35627*width, y: 0.55602*height), control1: CGPoint(x: 0.41075*width, y: 0.67571*height), control2: CGPoint(x: 0.35627*width, y: 0.63209*height))
            path.addCurve(to: CGPoint(x: 0.49707*width, y: 0.4099*height), control1: CGPoint(x: 0.35627*width, y: 0.5134*height), control2: CGPoint(x: 0.42724*width, y: 0.46425*height))
            path.closeSubpath()
            path.move(to: CGPoint(x: 0.55781*width, y: 0.67213*height))
            path.addLine(to: CGPoint(x: 0.52744*width, y: 0.51746*height))
            path.addCurve(to: CGPoint(x: 0.54173*width, y: 0.51667*height), control1: CGPoint(x: 0.53209*width, y: 0.51695*height), control2: CGPoint(x: 0.53687*width, y: 0.51667*height))
            path.addCurve(to: CGPoint(x: 0.63445*width, y: 0.58225*height), control1: CGPoint(x: 0.59294*width, y: 0.51667*height), control2: CGPoint(x: 0.63445*width, y: 0.54604*height))
            path.addCurve(to: CGPoint(x: 0.55781*width, y: 0.67213*height), control1: CGPoint(x: 0.63343*width, y: 0.61139*height), control2: CGPoint(x: 0.63147*width, y: 0.65479*height))
            path.closeSubpath()
            path.move(to: CGPoint(x: 0.49321*width, y: 0.34648*height))
            path.addCurve(to: CGPoint(x: 0.50347*width, y: 0.25269*height), control1: CGPoint(x: 0.47232*width, y: 0.29663*height), control2: CGPoint(x: 0.49121*width, y: 0.27179*height))
            path.addCurve(to: CGPoint(x: 0.58391*width, y: 0.17657*height), control1: CGPoint(x: 0.53245*width, y: 0.2076*height), control2: CGPoint(x: 0.55795*width, y: 0.19121*height))
            path.addCurve(to: CGPoint(x: 0.59737*width, y: 0.25269*height), control1: CGPoint(x: 0.61768*width, y: 0.18594*height), control2: CGPoint(x: 0.60244*width, y: 0.25269*height))
            path.addCurve(to: CGPoint(x: 0.49321*width, y: 0.34648*height), control1: CGPoint(x: 0.58147*width, y: 0.29208*height), control2: CGPoint(x: 0.52443*width, y: 0.32338*height))
            path.closeSubpath()
            return path
        }
}
