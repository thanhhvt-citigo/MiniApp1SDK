//
//  ViewController3.swift
//  MiniApp1
//
//  Created by thanh tien on 15/08/2022.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "VC3"
    }

    deinit {
        print("View Controller 3 deinit")
    }
    @IBAction func showVC4Action(_ sender: Any) {
        guard let vc4 = UIStoryboard.current.instantiateViewController(withIdentifier: "ViewController4") as? ViewController4 else {
            return
        }
        
        navigationController?.pushViewController(vc4, animated: true)
    }
}
