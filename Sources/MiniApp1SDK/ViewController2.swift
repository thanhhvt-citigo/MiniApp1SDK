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
        guard let vc4 = UIStoryboard.current.instantiateViewController(withIdentifier: "ViewController4") as? ViewController4 else {
            return
        }
        present(vc4, animated: true)
    }
}
