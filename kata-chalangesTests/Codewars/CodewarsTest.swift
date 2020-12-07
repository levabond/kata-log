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
    }
}
