import Foundation

enum Octave: String, CaseIterable, Identifiable {
    case small = "small", oneLine = "oneLine", twoLine = "twoLine"
    var id: String { return self.rawValue }
}
