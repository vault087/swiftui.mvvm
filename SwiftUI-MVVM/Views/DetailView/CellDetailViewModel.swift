//
//  CellDetailViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Andrey Soloviov on 7/8/20.
//  Copyright © 2020 Andrei Solovev. All rights reserved.
//

import SwiftUI

class CellDetailViewModel: ViewModel, ObservableObject {
  private var store: CarStore
  var id: UUID
  
  init(id: UUID, store: CarStore) {
    self.id = id
    self.store = store
    super.init()
  }
  
  func tap() {
    objectWillChange.send()
  }
}

extension ViewModelGlobalStore {
  func cellDetailViewModel(id: UUID, store: CarStore) -> CellDetailViewModel {
    return viewModel(for: "cellDetailViewModel \(id)") {
      CellDetailViewModel(id: id, store: store)
    }
  }
}
