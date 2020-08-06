//
//  CellViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Andrey Soloviov on 7/8/20.
//  Copyright © 2020 Andrei Solovev. All rights reserved.
//

import SwiftUI

class CellViewModel: ViewModel, ObservableObject {
  var id: UUID!
  
  init(id: UUID) {
    self.id = id
    super.init()
  }
  
  func detailsViewModel(store: CarStore) -> CellDetailViewModel {
    return AppState.shared.viewModelStore.cellDetailViewModel(id: id, store: store)
  }
  
  func headerViewModel(store: CarStore) -> CellHeaderViewModel {
    return AppState.shared.viewModelStore.cellHeaderViewModel(id: id, store: store)
  }
}

extension ViewModelGlobalStore {
  func cellViewModel(id: UUID) -> CellViewModel {
    return viewModel(for: "cellViewModel \(id)") {
      CellViewModel(id: id)
    }
  }
}
