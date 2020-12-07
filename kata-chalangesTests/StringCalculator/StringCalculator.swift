//
//  StringCalculator.swift
//  kata-chalangesTests
//
//  Created by Лев Бондаренко on 06.12.2020.
//

import Quick
import Nimble
import XCTest
@testable import kata_chalanges

class StringCalculatorTest: QuickSpec {
    var sup: StringCalculator!

    
    override func spec() {
        super.spec()
        
        describe("method add given a delimited string") {
            beforeEach {
                self.sup = StringCalculator()
            }
            
            context("returns the sum of the numbers in the string") {
                it("An empty string returns zero '' => 0") {
                    expect(self.sup.add("")).to(equal(0))
                }
                
                it("returns the value \'1\' => 1 \'2\' => 2") {
                    expect(self.sup.add("1")).to(equal(1))
                }
            }
            
            context("return summ") {
                it("'1,2' => 3") {
                    expect(self.sup.add("1,2")).to(equal(3))
                }
                
                it("'10,20' => 30") {
                    expect(self.sup.add("10,20")).to(equal(30))
                }
            }
            
            context("Two numbers, newline delimited, returns the sum ") {
                it("'1\n2' => 3") {
                    expect(self.sup.add("1\n2")).to(equal(3))
                }
                
                it("1\n2,3\n4' => 10") {
                    expect(self.sup.add("1\n2,3\n4")).to(equal(10))
                }
            }
        }
    }
}
