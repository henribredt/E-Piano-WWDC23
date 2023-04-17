import Foundation

enum Note: String, Identifiable {
    case small_C = "small_C",
         small_D = "small_D",
         small_E = "small_E",
         small_F = "small_F",
         small_G = "small_G",
         small_A = "small_A",
         small_B = "small_B",
         small_C_Sharp = "small_C_Sharp",
         small_D_Sharp = "small_D_Sharp",
         small_F_Sharp = "small_F_Sharp",
         small_G_Sharp = "small_G_Sharp",
         small_A_Sharp = "small_A_Sharp"
    
    case oneLine_C = "oneLine_C",
         oneLine_D = "oneLine_D",
         oneLine_E = "oneLine_E",
         oneLine_F = "oneLine_F",
         oneLine_G = "oneLine_G",
         oneLine_A = "oneLine_A",
         oneLine_B = "oneLine_B",
         oneLine_C_Sharp = "oneLine_C_Sharp",
         oneLine_D_Sharp = "oneLine_D_Sharp",
         oneLine_F_Sharp = "oneLine_F_Sharp",
         oneLine_G_Sharp = "oneLine_G_Sharp",
         oneLine_A_Sharp = "oneLine_A_Sharp"
    
    case twoLine_C = "twoLine_C",
         twoLine_D = "twoLine_D",
         twoLine_E = "twoLine_E",
         twoLine_F = "twoLine_F",
         twoLine_G = "twoLine_G",
         twoLine_A = "twoLine_A",
         twoLine_B = "twoLine_B",
         twoLine_C_Sharp = "twoLine_C_Sharp",
         twoLine_D_Sharp = "twoLine_D_Sharp",
         twoLine_F_Sharp = "twoLine_F_Sharp",
         twoLine_G_Sharp = "twoLine_G_Sharp",
         twoLine_A_Sharp = "twoLine_A_Sharp"

    var id: String { return self.rawValue }
    
    func getHelpLabel() -> String {
        var helpText = self.rawValue
        helpText = helpText.replacingOccurrences(of: "_Sharp", with: "", options: [.caseInsensitive, .regularExpression])
        helpText = helpText.replacingOccurrences(of: "twoLine_", with: "", options: [.caseInsensitive, .regularExpression])
        helpText = helpText.replacingOccurrences(of: "oneLine_", with: "", options: [.caseInsensitive, .regularExpression])
        helpText = helpText.replacingOccurrences(of: "small_", with: "", options: [.caseInsensitive, .regularExpression])
        
        if self.rawValue.contains("Sharp") {
            helpText.append("#")
        }
        
        return helpText
    }
}
