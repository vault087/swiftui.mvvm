//
//  ContentView.swift
//  SwiftUI-MVVM
//
//  Created by Andrei Solovev on 6/8/2563 BE.
//  Copyright © 2563 Andrei Solovev. All rights reserved.
//

import SwiftUI

let testCars: [Car] = [
    Car(title: "Ford Fiesta", year: "2013", history: [CarHistory(year: "2013", name: "Mr. A")]),
    Car(title: "Mazda 3", year: "2015", history: [CarHistory(year: "2015", name: "Ms.B"), CarHistory(year: "2016", name: "Ms.C"), CarHistory(year: "2018", name: "Ms.D"), ]),
    Car(title: "Honda Jazz", year: "2016", history: [CarHistory(year: "2016", name: "Mr. AA"), CarHistory(year: "2016", name: "Mr. BB")]),
    Car(title: "Mazda 2", year: "2020", history: []),

]
let carStore = CarStore(testCars)

struct ContentView: View {
    @StateObject var store = CarStore(testCars)
    var body: some View {
        List(carStore.cars) { car in
            CellView(viewModel: CellViewModel(id: car.id, store: store))
                .padding()
        }
    }
}
