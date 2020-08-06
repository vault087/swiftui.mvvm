import Foundation


struct Car: Identifiable {
    var id = UUID()
    var title: String
    var year: String
    var history: [CarHistory]
}

struct CarHistory: Identifiable {
    var id = UUID()
    var year: String
    var name: String
}
