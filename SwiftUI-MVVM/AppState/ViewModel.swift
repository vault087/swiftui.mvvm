//
//  ViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Andrey Soloviov on 7/8/20.
//  Copyright © 2020 Andrei Solovev. All rights reserved.
//

import SwiftUI

class ViewModel {
  lazy var internalId: Int = {
    Counter.getCounter(for: self).nextCounter()
  }()
    
  deinit {
    print("\(self) deinit \(internalId)")
  }
  
  init() {
    print("\(self) init \(internalId)")
  }
}
