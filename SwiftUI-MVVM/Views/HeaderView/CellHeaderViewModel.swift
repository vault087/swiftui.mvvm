//
//  CellHeaderViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Andrey Soloviov on 7/8/20.
//  Copyright © 2020 Andrei Solovev. All rights reserved.
//

import SwiftUI
import Combine

class CellHeaderViewModel: ViewModel, ObservableObject {
  private var store: CarStore
  var id: UUID!
  
  @Published var storeCounter: Int
  
  init(id: UUID, store: CarStore) {
    self.id = id
    self.store = store
    self.storeCounter = store.counter
    super.init()

    store.$counter.assign(to: &$storeCounter)
  }
  
  func tap() {
    store.incrementCounter()
  }
  
}

extension ViewModelGlobalStore {
  func cellHeaderViewModel(id: UUID, store: CarStore) -> CellHeaderViewModel {
    return viewModel(for: "cellHeaderViewModel \(id)") {
      CellHeaderViewModel(id: id, store: store)
    }
  }
}
