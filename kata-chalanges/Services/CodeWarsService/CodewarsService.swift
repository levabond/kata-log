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
}
