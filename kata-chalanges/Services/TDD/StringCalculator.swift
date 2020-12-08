//
//  StringManager.swift
//  kata-chalanges
//
//  Created by Лев Бондаренко on 06.12.2020.
//

import Foundation

class StringCalculator {
    func add(_ str: String) -> Int {
        str.trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: [",", "\n"]).reduce(0) {
            $0 + (Int(String($1)) ?? 0)
        }
    }
    
    func duplicateEncoder(_ string: String) -> String {
        return string.map { char in
            string.filter({ char.lowercased() == $0.lowercased() }).count == 1 ? "(" : ")"
        }.joined()
    }
}
