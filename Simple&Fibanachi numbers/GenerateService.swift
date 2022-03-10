//
//  GenerateService.swift
//  Simple&Fibanachi numbers
//
//  Created by zz on 10.03.2022.
//  Copyright © 2022 Vadim Vitkovskiy. All rights reserved.
//

import Foundation

class GenerateService {
    static let shared = GenerateService()
    func generate(completion: @escaping (_ index: UInt64, _ value: UInt64) -> ()) {
        var count: UInt64 = 0
        for index in 0..<UInt64.max {
            if isPrime(num: index) {
                count+=1
                completion(count, index)
            }
        }
    }
    func isPrime(num: UInt64) -> Bool {
        guard num >= 2 else { return false }
        for i in 2..<num {
            if num%i == 0 {
                return false
            }
        }
        return true
    }
    func sequence<T>(first: T, while condition: @escaping (T)-> Bool, next: @escaping (T) -> T) -> UnfoldSequence<T, T> {
        let nextState = { (state: inout T) -> T? in
            guard condition(state) else { return nil }
            defer { state = next(state) }
            return state
        }
        return Swift.sequence(state: first, next: nextState)
    }
    
    func fib(completion: @escaping (_ value: Double, _ index: Int) -> ()) {
        var count = 0
        for f in sequence(first: (0, 1), while: { $1 <= 1E51 }, next: { ($1, $0 + $1)}) {
            count += 1
            completion((f.1), count)
        }
    }
}

