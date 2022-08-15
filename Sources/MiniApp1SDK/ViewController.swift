//
//  ViewController.swift
//  MiniApp1
//
//  Created by thanh tien on 15/08/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "VC1"
    }
    
    @IBAction func showVC2Action(_ sender: Any) {
        guard let vc2 = UIStoryboard.current.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2 else {
            return
        }
        
        navigationController?.pushViewController(vc2, animated: true)
    }
    
    deinit {
        print("View Controller deinit")
    }
}

