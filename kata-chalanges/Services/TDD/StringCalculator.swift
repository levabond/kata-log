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
}
