import Foundation

enum Octave: String, CaseIterable, Identifiable {
    case small = "small"
    case oneLine = "oneLine"
    case twoLine = "twoLine"
    
    var id: String { return self.rawValue }
}
