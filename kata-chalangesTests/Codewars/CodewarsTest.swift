//
//  CodewarsTest.swift
//  kata-chalangesTests
//
//  Created by Лев Бондаренко on 05.12.2020.
//

import Quick
import Nimble
import XCTest
@testable import kata_chalanges

class CodewarsTest: QuickSpec {
    var sup: CodewarsService!

    
    override func spec() {
        super.spec()
        
        describe("function that will return the count") {
            beforeEach {
                self.sup = CodewarsService()
            }
            context("dublicate") {
                it("abcde") {
                    expect(self.sup.countDuplicates("abcde")).to(equal(0))
                }
                it("aabbcde") {
                    expect(self.sup.countDuplicates("aabbcde")).to(equal(2))
                }
                it("aabBcde") {
                    expect(self.sup.countDuplicates("aabBcde")).to(equal(2))
                }
                it("indivisibility") {
                    expect(self.sup.countDuplicates("indivisibility")).to(equal(1))
                }
            }
        }
        
        describe("personalized greeting") {
            beforeEach {
                self.sup = CodewarsService()
            }
            
            context("greeting") {
                it("Daniel Daniel") {
                    expect(self.sup.greeting(guest: "Daniel", boss: "Daniel")).to(equal("Hello boss"))
                }
                it("Daniel Daniel") {
                    expect(self.sup.greeting(guest: "Daniel", boss: "Mary")).to(equal("Hello quest"))
                }
            }
        }
        
        describe("Find the nth Digit of a Number") {
            beforeEach {
                self.sup = CodewarsService()
            }

            context("return the nth digit of num (counting from right to left).") {
                it("5673, 4") {
                    expect(self.sup.findDigit(5673, 4)).to(equal(5))
                }
                
                it("123, 2") {
                    expect(self.sup.findDigit(5673, 4)).to(equal(5))
                }

                it("-2825, 3") {
                    expect(self.sup.findDigit(-2825, 3)).to(equal(8))
                }

                it("-456, 4") {
                    expect(self.sup.findDigit(-456, 4)).to(equal(0))
                }
                
                it("0, 20") {
                    expect(self.sup.findDigit(0, 20)).to(equal(0))
                }
                
                it("65, 0") {
                    expect(self.sup.findDigit(65, 0)).to(equal(-1))
                }
            }
        }
        
        describe("returns its multiplicative persistence, which is the number of times you must multiply the digits") {
            beforeEach {
                self.sup = CodewarsService()
            }

            context("in num until you reach a single digit.") {
                it("(for: 39) === 3") {
                    expect(self.sup.persistance(for: 39)).to(equal(3))
                }
            }
        }
        
//        XCTAssertEqual(findSum(5), 8)
//                XCTAssertEqual(findSum(10), 33)
//                XCTAssertEqual(findSum(100), 2418)
//                XCTAssertEqual(findSum(1000), 234168)
        
        describe("returns summ") {
            beforeEach {
                self.sup = CodewarsService()
            }

            context("") {
                it("5 -> 8") {
                    expect(self.sup.findSum(5)).to(equal(8))
                }
                it("100 -> 2418") {
                    expect(self.sup.findSum(100)).to(equal(2418))
                }
                it("5 -> 8") {
                    expect(self.sup.findSum(1000)).to(equal(234168))
                }
            }
        }
    }
}
