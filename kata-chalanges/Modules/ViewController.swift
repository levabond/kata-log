//
//  ViewController.swift
//  kata-chalanges
//
//  Created by Лев Бондаренко on 05.12.2020.
//

import UIKit


class Object: NSObject {
    
}

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startDispatchGroupNotify()
    }
    
    
    
    // MARK: GCD
    
    func startDispatchGroupNotify() {
        let group = DispatchGroup()
        let queue = DispatchQueue.global(qos: .userInitiated)
        
        queue.async(group: group, execute: DispatchWorkItem(block: {
            print("group 1")
        }))
        queue.async(group: group, execute: DispatchWorkItem(block: {
            for _ in 0...1000 {}
            queue.async(group: group, execute: DispatchWorkItem(block: {
                for _ in 0...5000 {}
                print(1)
            }))
        }))
        
        group.notify(queue: DispatchQueue.main) {
            self.startDispatchGroupWait()
        }
    }
    
    func startDispatchGroupWait() {
        let group = DispatchGroup()
        let queue = DispatchQueue.global(qos: .userInitiated)
        
        queue.async(group: group, execute: DispatchWorkItem(block: {
            print("group wait 1")
        }))
        queue.async(group: group, execute: DispatchWorkItem(block: {
            for _ in 0...1000 {}
            queue.async(group: group, execute: DispatchWorkItem(block: {
                for _ in 0...5000 {}
                print(1)
            }))
        }))
        
        if (group.wait(timeout: .now() + 5) == .success) {
//            self.textLabel.text = "All jobs timeout"
            startSleep()
        }
    }
    
    func startSleep() {
        let group = DispatchGroup()
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async(group: group) {
            print("Start job 1")
            Thread.sleep(until: Date().addingTimeInterval(3))
            print("End job 1")
        }
        queue.async(group: group) {
            print("Start job 2")
            Thread.sleep(until: Date().addingTimeInterval(2))
            print("End job 2")
            self.threads()
        }
    }
    
    func threads() {
        DispatchQueue.global(qos: .background).sync {
            print(1)
            
            DispatchQueue.global(qos: .background).async {
                print(2)
            }
            
            DispatchQueue.global(qos: .background).async {
                for _ in 0...1000 {}
            }
        }
        
        DispatchQueue.global(qos: .background).sync {
            print(3)
            
            let fibonacciSumm = Set(arrayLiteral: 1,1,2,3,5,8,13).reduce(0, +)
            print(fibonacciSumm)
        }
    }
    
    deinit {
        print("viewController deinit")
    }
    
}
