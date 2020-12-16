//
//  ViewController.swift
//  kata-chalanges
//
//  Created by Лев Бондаренко on 05.12.2020.
//

import UIKit
import AsyncDisplayKit

class Object: NSObject {
    
}

class ViewController: ASDKViewController<ASDisplayNode>, ASTableDataSource, ASTableDelegate {
    var tableNode: ASTableNode {
        return node as! ASTableNode
    }
    
    override init() {
        super.init(node: ASTableNode())
        tableNode.delegate = self
        tableNode.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        startDispatchGroupNotify()
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        // Should read the row count directly from table view but
        // https://github.com/facebook/AsyncDisplayKit/issues/1159
        return {
              let node = ASTextCellNode()
              node.text = String(format: "[%ld.%ld] says hello!", indexPath.section, indexPath.row)
              return node
            }
    }
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    
    
    // MARK: GCD
    
    func removeChildController(_ child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
        child.didMove(toParent: nil)
    }
    
    
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
