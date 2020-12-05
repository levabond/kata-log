//
//  GreeterServiceTest.swift
//  kata-chalangesTests
//
//  Created by Лев Бондаренко on 05.12.2020.
//

import XCTest
import Quick
import Nimble
@testable import kata_chalanges

class GreeterServiceTest: QuickSpec {
    var sup: SenderService!
    
    override func spec() {
        describe("SenderService") {
            sup = SenderService()
            context("say") {
                it("Hello Name") {
                    expect(self.sup.greeter("Name")).to(equal("Hello Name"))
                }
                
                it("trims the input") {
                    expect(self.sup.greeter("Name   ")).to(equal("Hello Name"))
                }
                
                it("Good morning time is 06:00-12:00") {
                    expect(self.sup.greeter("Lev",
                                            time: Date(timeIntervalSinceReferenceDate: 1607146353)))
                        .to(equal("Good morning Lev"))
                }
                
                it("Good evening time is 18:00-22:00") {
                    expect(self.sup.greeter("Lev",
                                            time: Date(timeIntervalSinceReferenceDate: 1607175153)))
                        .to(equal("Good evening Lev"))
                }
                
                it("Good night time is 22:00-06:00") {
                    expect(self.sup.greeter("Lev",
                                            time: Date(timeIntervalSinceReferenceDate: 1607207553)))
                        .to(equal("Good night Lev"))
                }
            }
        }
    }
    
}
