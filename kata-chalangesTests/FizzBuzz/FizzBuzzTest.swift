//
//  FizzBuzzTest.swift
//  kata-chalangesTests
//
//  Created by Лев Бондаренко on 10.12.2020.
//

import Quick
import Nimble
@testable import kata_chalanges

class FizzBuzzTest: QuickSpec {
    var sup: FizzBuzzService!
        
    override func spec() {
        describe("program returns array of numbers") {
            beforeEach {
                self.sup = FizzBuzzService()
            }
            context("from 1 to 100") {
                it("while multiples of three return Fizz") {
                    let array = (0...100)
                        .map { $0 % 3 == 0 ? "Fizz" : "\($0)" }
                    
                    expect(self.sup.generateArray).to(equal(array))
                }
            }
        }
    }

}
