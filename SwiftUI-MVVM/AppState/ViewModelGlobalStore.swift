//
//  ViewModelGlobalStore.swift
//  SwiftUI-MVVM
//
//  Created by Andrey Soloviov on 7/8/20.
//  Copyright © 2020 Andrei Solovev. All rights reserved.
//

import Foundation

class ViewModelGlobalStore {
  let cache = NSMapTable<NSString, AnyObject>(keyOptions: NSPointerFunctions.Options.strongMemory, valueOptions: NSPointerFunctions.Options.weakMemory)
  
  lazy var internalId: Int = {
    Counter.getCounter(for: self).nextCounter()
  }()
  
  deinit {
    print("\(self) deinit \(internalId)")
  }
  
  init() {
    print("\(self) init \(internalId)")
  }
  
  func viewModel<VM: AnyObject>(for key: String, builder: () -> (VM)) -> VM {
    if let vm = cache.object(forKey: key as NSString) {
      return vm as! VM
    } else {
      let vm = builder()
      cache.setObject(vm, forKey: key as NSString)
      return vm
    }
  }  
}
