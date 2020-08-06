//
//  Counter.swift
//  SwiftUI-MVVM
//
//  Created by Andrei Solovev on 6/8/2563 BE.
//  Copyright © 2563 Andrei Solovev. All rights reserved.
//

import Foundation

class Counter {
  static var viewModelStoreCounter = [String: Counter]()
  
  static func getCounter(for obj: Any) -> Counter {
    let key = String(describing: obj)
    if let counter = viewModelStoreCounter[key] {
      return counter
    } else {
      viewModelStoreCounter[key] = Counter()
      return viewModelStoreCounter[key]!
    }
  }

  
  private(set) var value = 0
  func nextCounter() -> Int {
    value += 1
    return value
  }
}


