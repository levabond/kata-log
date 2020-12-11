//
//  FizzBuzzService.swift
//  kata-chalanges
//
//  Created by Лев Бондаренко on 10.12.2020.
//

import Foundation

open class FizzBuzzService {
    func generateArray() -> [String] {
        (0...100).map { (num) -> String in
            if num % 3 == 0 {
                return "Fizz"
            }
            return "\(num)"
        }
    }
}
