//
//  ContentView.swift
//  SwiftUI-MVVM
//
//  Created by Andrei Solovev on 6/8/2563 BE.
//  Copyright © 2563 Andrei Solovev. All rights reserved.
//

import SwiftUI


@main
struct ContentView: App {
  @StateObject var viewModel = ContentViewModel()
  @State var showList: Bool = true
  var body: some Scene {
    WindowGroup {
      VStack {
        Text("Store counter: \(viewModel.storeCounter)")
        if showList {
          List(viewModel.cars) { car in
            CellView(viewModel: AppState.shared.viewModelStore.cellViewModel(id: car.id))
              .padding()
              .environmentObject(AppState.shared)
          }
        }
        Spacer()
        Button(action: { showList.toggle()} ) {
          Text(showList ? "Hide list" : "Show list").padding()
        }
      }
    }
  }
}


class ContentViewModel: ObservableObject {
  var store = AppState.shared.carStore
  @Published var storeCounter: Int
  @Published var cars: [Car]

  init() {
    storeCounter = store.counter
    cars = store.cars
    
    store.$counter.assign(to: $storeCounter)
    store.$cars.assign(to: $cars)
  }
}
