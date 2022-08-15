//
//  ViewController4.swift
//  MiniApp1
//
//  Created by thanh tien on 15/08/2022.
//

import UIKit
import KVStandardConnection

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "VC4"
    }
    
    @IBAction func fakeErrorAction(_ sender: Any) {
        showAlert(title: "An error occur", message: "Oops, something wrong!", action: nil, cancel: {
            let manager = MiniApp1Manager.shared
            manager?.delegate?.received?(action: TerminatedAction())
        })
    }
    
    deinit {
        print("View Controller 4 deinit")
    }
}

public class TerminatedAction: MiniAppAction {
    public var appId: String = MiniApp1Manager.shared.appId
    
    public var name: String = "Terminated"
    
    public var params: [String : Any] = ["Param1": "Here is param1", "Param2": "Here is param2"]
}
