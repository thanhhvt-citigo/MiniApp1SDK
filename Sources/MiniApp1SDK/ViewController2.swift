//
//  ViewController2.swift
//  MiniApp1
//
//  Created by thanh tien on 15/08/2022.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "VC2"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(modalPresent))
    }
    
    @objc private func modalPresent() {
        guard let vc3 = UIStoryboard.current.instantiateViewController(withIdentifier: "ViewController3") as? ViewController3 else {
            return
        }
        present(UINavigationController(rootViewController: vc3), animated: true)
    }
    
    deinit {
        print("View Controller 2 deinit")
    }
}
