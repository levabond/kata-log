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
            
//            findDigit(5673, 4)     returns 5
//            findDigit(129, 2)      returns 2
//            findDigit(-2825, 3)    returns 8
//            findDigit(-456, 4)     returns 0
//            findDigit(0, 20)       returns 0
//            findDigit(65, 0)       returns -1
//            findDigit(24, -8)      returns -1

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
    }
}
