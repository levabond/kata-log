//
//  PrimeFactorsService.swift
//  kata-chalanges
//
//  Created by Лев Бондаренко on 08.12.2020.
//

import Foundation

class PrimeFactors {
    var array: [Int] = []
    
    func generate(_ num: Int) -> [Int] {
        prepareArray(num)
        
        return array
    }
    
    private func prepareArray(_ num: Int) {
        for item in (0...num) {
            if item > 1, num % item == 0 {
                if num > 3 {
                    print("prepare", item)
                }
                print("item")
                array.append(item)
                prepareArray(num / item)
                return
            }
        }
    }
}
