//
//  CodewarsService.swift
//  kata-chalanges
//
//  Created by Лев Бондаренко on 05.12.2020.
//

import Foundation

class CodewarsService {
    
    //    Write a function that will return the count of
    //    distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string.
    //    The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
    
    //    Example
    //    "abcde" -> 0 # no characters repeats more than once
    //    "aabbcde" -> 2 # 'a' and 'b'
    //    "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
    //    "indivisibility" -> 1 # 'i' occurs six times
    //    "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
    //    "aA11" -> 2 # 'a' and '1'
    //    "ABBA" -> 2 # 'A' and 'B' each occur twice
    
    func countDuplicates(_ s:String) -> Int {
        var elements: [String: Int] = [:]
        
        Array(s).forEach { (char) in
            elements[char.lowercased(), default: 0] += 1
        }
        
        return elements.values.filter { $0 > 1 }.count
    }
    
    //    Create a function that gives a personalized greeting. This function takes two parameters: name and owner.
    //    Create a function that gives a personalized greeting. This function takes two parameters: name and owner.
    //
    //    Use conditionals to return the proper message:
    //
    //    case                  return
    //    name equals owner     'Hello boss'
    //    otherwise             'Hello guest'
    
    func greeting(guest: String, boss: String) -> String {
        guest == boss ? "Hello boss" : "Hello quest"
    }
    
    
    //    Complete the function that takes two numbers as input, num and nth and return the nth digit of num (counting from right to left).
    
    //    Note
    //    If num is negative, ignore its sign and treat it as a positive value
    //    If nth is not positive, return -1
    //    Keep in mind that 42 = 00042. This means that findDigit(42, 5) would return 0
    
    func findDigit(_ num:Int, _ nth: Int) -> Int {
        // Go.
        let positiveNum = num < 0 ? num * -1 : num
        if nth <= 0 {
            return -1
        }
        
        let reservedStrNum = Array(String(String(positiveNum).reversed()))
        
        
        if nth > reservedStrNum.count  {
            return 0
        }
        
        for item in 0...reservedStrNum.count {
            if item == nth {
                return reservedStrNum[item - 1].wholeNumberValue ?? 0
            }
        }
        
        return 0
    }
    
    //    Description:
    //    Write a function, persistence, that takes in a positive parameter num and returns
    //    its multiplicative persistence, which is the number of times you must multiply the digits
    //    in num until you reach a single digit.
    // https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/
    
    
    func persistance(for num: Int) -> Int {
        let digits: [Int] = String(num).compactMap { Int(String($0)) }
        
        return digits.count == 1 ? 0 : 1 + persistance(for: digits.reduce(1, *))
    }
}
