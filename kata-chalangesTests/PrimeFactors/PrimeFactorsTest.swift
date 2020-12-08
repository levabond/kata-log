//
//  PrimeFactorsTest.swift
//  kata-chalangesTests
//
//  Created by Лев Бондаренко on 08.12.2020.
//

import Nimble
import Quick
@testable import kata_chalanges

class PrimeFactorsTest: QuickSpec {
    var sup: PrimeFactors!
    
    override func spec() {
        describe("function generate") {
            beforeEach {
                self.sup = PrimeFactors()
            }
            context("return list contains the prime factors in numerical sequence") {
                it("1 => []") {
                    expect(self.sup.generate(1)).to(equal([]))
                }
                
                it("2 => [2]") {
                    expect(self.sup.generate(2)).to(equal([2]))
                }
                
                it("3 => [3]") {
                    expect(self.sup.generate(3)).to(equal([3]))
                }

                it("4 should return [2,2]") {
                    expect(self.sup.generate(4)).to(equal([2,2]))
                }
                
                it("5 should return [5]") {
                    expect(self.sup.generate(5)).to(equal([5]))
                }
                
                it("6 should return [2,3]") {
                    expect(self.sup.generate(6)).to(equal([2, 3]))
                }
                
                it("8 should return [2,2,2]") {
                    expect(self.sup.generate(8)).to(equal([2, 2, 2]))
                }
                
                it("4620 should return [2,2,3,5,7,11]") {
                    expect(self.sup.generate(4620)).to(equal([2,2,3,5,7,11]))
                }
            }
        }
    }

}
