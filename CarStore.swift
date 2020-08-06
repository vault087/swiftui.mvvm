import SwiftUI

class CarStore: ObservableObject {
    @Published var cars: [Car]
    init(_ cars: [Car]) {
        self.cars = cars
    }
}

