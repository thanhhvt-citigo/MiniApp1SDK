//
//  ViewController4.swift
//  MiniApp1
//
//  Created by thanh tien on 15/08/2022.
//

import UIKit

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "VC4"
    }
    
    @IBAction func dismissMiniAppAction(_ sender: Any) {
        MiniApp1Manager.shared.dismiss {
            print("dismiss inside mini app")
        }
    }
    
    deinit {
        print("View Controller 4 deinit")
    }
}
