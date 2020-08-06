//
//  Counter.swift
//  SwiftUI-MVVM
//
//  Created by Andrei Solovev on 6/8/2563 BE.
//  Copyright © 2563 Andrei Solovev. All rights reserved.
//

import Foundation

class Counter {
    var counter = 0
    func getCounter() -> Int {
        counter += 1
        return counter
    }
}
