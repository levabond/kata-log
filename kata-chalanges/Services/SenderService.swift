//
//  SenderService.swift
//  kata-chalanges
//
//  Created by Лев Бондаренко on 05.12.2020.
//

import Foundation

class SenderService {
    func greeter(_ name: String,
                 time: Date? = nil) -> String {
        let name = name.capitalized.trimmingCharacters(in: .whitespacesAndNewlines)
        var greeting: String = "Hello"
        
        
        if let time = time,
           let str = prepare(time: time) {
           greeting = str
        }
        
        
        return "\(greeting) \(name)"
    }
    
    private func prepare(time: Date) -> String? {
        let calendar = Calendar.current

        switch calendar.component(.hour, from: time) {
        case 7..<12:
            return "Good morning"
        case 12..<18:
            return "Hello"
        case 18..<22:
            return "Good evening"
        default:
            return "Good night"
        }
    }
}
