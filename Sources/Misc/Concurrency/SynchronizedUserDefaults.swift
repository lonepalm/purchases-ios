//
//  Copyright RevenueCat Inc. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  SynchronizedUserDefaults.swift
//
//  Created by Nacho Soto on 11/20/21.

import Foundation

/// A `UserDefaults` wrapper to synchronize access and writes.
///
/// - SeeAlso: `Atomic`.
internal final class SynchronizedUserDefaults {
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    func read<T>(_ action: (UserDefaults) throws -> T) rethrows -> T {
        try action(userDefaults)
    }
    
    func write(_ action: (UserDefaults) throws -> Void) rethrows {
        try action(userDefaults)
    }
    
}
