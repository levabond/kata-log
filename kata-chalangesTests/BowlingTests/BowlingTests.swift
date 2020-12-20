//
//  BowlingTests.swift
//  kata-chalangesTests
//
//  Created by Лев Бондаренко on 10.12.2020.
//

import Nimble
import Quick
@testable import kata_chalanges

class BowlingTest: QuickSpec {
    var sup: BowlingService!
    
    override func spec() {
        beforeEach {
            self.sup = BowlingService()
        }
        
        describe("Bowling Game") {
            context("get game") {
                it("score") {
//                    expect(self.sup.persistance(for: 39)).to(equal(3))
                    expect(self.sup.getScore()).to(equal(0))
                }
            }
        }
    }
}
