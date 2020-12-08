//
//  ViewController.swift
//  kata-chalanges
//
//  Created by Лев Бондаренко on 05.12.2020.
//

import UIKit



class ViewController: UIViewController {
    lazy var textLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 300, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textLabel)
        
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
            self.textLabel.text = "All jobs have completed"
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
            self.textLabel.text = "All jobs timeout"
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
        }
    }
    
    deinit {
        print("viewController deinit")
    }
    
}
