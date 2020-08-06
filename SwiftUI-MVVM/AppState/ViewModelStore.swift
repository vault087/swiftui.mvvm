//
//  ViewModelStore.swift
//  SwiftUI-MVVM
//
//  Created by Andrey Soloviov on 7/8/20.
//  Copyright © 2020 Andrei Solovev. All rights reserved.
//

import Foundation

class ViewModelStore<ViewModel: AnyObject> {
  let cache = NSMapTable<NSUUID, ViewModel>(keyOptions: NSPointerFunctions.Options.strongMemory, valueOptions: NSPointerFunctions.Options.weakMemory)
  
  lazy var internalId: Int = {
    Counter.getCounter(for: self).nextCounter()
  }()

  deinit {
    print("\(self) deinit \(internalId)")
  }
  
  init() {
    print("\(self) init \(internalId)")
  }
  
  func viewModel(id: UUID) -> ViewModel {
    if let vm = cache.object(forKey: id as NSUUID) {
      return vm
    } else {
      let vm = createViewModel(id: id)
      cache.setObject(vm, forKey: id as NSUUID)
      return vm
    }
  }
  
  func createViewModel(id: UUID) -> ViewModel {
    fatalError("Override in subclass")
  }
}
