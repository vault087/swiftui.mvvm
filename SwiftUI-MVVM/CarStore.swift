import SwiftUI

class CarStore: ObservableObject {
  @Published var cars: [Car]

  @Published private(set) var counter: Int = Counter.getCounter(for: "CarStore" as NSString).nextCounter()
  
  init(_ cars: [Car]) {
    self.cars = cars
  }
  
  func incrementCounter() {
    counter += 1
  }
}

