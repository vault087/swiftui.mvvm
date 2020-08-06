//
//  AppState.swift
//  SwiftUI-MVVM
//
//  Created by Andrey Soloviov on 6/8/20.
//  Copyright © 2020 Andrei Solovev. All rights reserved.
//

import SwiftUI

let testCars: [Car] = [
  Car(title: "Ford Fiesta", year: "2013", history: [CarHistory(year: "2013", name: "Mr. A")]),
  Car(title: "Mazda 3", year: "2015", history: [CarHistory(year: "2015", name: "Ms.B"), CarHistory(year: "2016", name: "Ms.C"), CarHistory(year: "2018", name: "Ms.D"), ]),
  Car(title: "Honda Jazz", year: "2016", history: [CarHistory(year: "2016", name: "Mr. AA"), CarHistory(year: "2016", name: "Mr. BB")]),
  Car(title: "Mazda 2", year: "2020", history: []),
]


class AppState: ObservableObject {
  static var shared: AppState = AppState()
  
  var carStore = CarStore(testCars)
  var viewModelStore = ViewModelGlobalStore()
}
