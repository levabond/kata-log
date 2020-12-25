//
//  AlgorithmTests.swift
//  kata-chalangesTests
//
//  Created by Лев Бондаренко on 24.12.2020.
//


import Nimble
import Quick
@testable import kata_chalanges

class AlgorithmTests: QuickSpec {
    
    var sup: AlgorithmService!
    
    override func spec() {
        beforeEach {
            self.sup = AlgorithmService()
        }
        
        describe("Reverse") {
            context("array") {
                it("[1,2,3] == [3,2,1]") {
                    expect(self.sup.reverse([1,2,3])).to(equal([3,2,1]))
                }
            }
        }
    }
}
