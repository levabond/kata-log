//
//  ViewController.swift
//  kata-chalanges
//
//  Created by Лев Бондаренко on 05.12.2020.
//

import UIKit

class ViewController: UIViewController {

    lazy var textLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textLabel)
        
        DispatchQueue.global(qos: .utility).async { [weak self] in
          guard let self = self else { return }
          // Perform your work here
          // ...
          // Switch back to the main queue to
          // update your UI
          DispatchQueue.main.async {
            self.textLabel.text = "New articles available!"
          }
        }
        
        

        // Do any additional setup after loading the view.
    }


}

