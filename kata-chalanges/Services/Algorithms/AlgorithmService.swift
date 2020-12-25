//
//  AlgorithmService.swift
//  kata-chalanges
//
//  Created by Лев Бондаренко on 24.12.2020.
//

import Foundation

class AlgorithmService {
    // for reverse only insert
    func reverse<T>(_ array: [T]) -> [T] {
        var stack: Array<T> = []
        
        for item in array {
            stack.insert(item, at: 0)
        }
        // pop last for remove
        stack.forEach { (item) in
            print(item)
        }
        
        return stack
    }
    
    
}

public class Node<Value> {
  public var value: Value
  public var next: Node?
    
  public init(value: Value, next: Node? = nil) {
    self.value = value
    self.next = next
  }
}

extension Node: CustomStringConvertible {
  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}
