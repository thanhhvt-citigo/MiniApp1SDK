//
//  File.swift
//  
//
//  Created by thanh tien on 15/08/2022.
//

import Foundation
import UIKit
import KVStandardConnection

public class MiniAppManager: MiniApp {
    public var appId: String
    
    public var delegate: MiniappDelegate?
    public var superAppId: String
 
    public var rootViewController: UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.module)
        return storyboard.instantiateViewController(withIdentifier: "ViewController3") as? ViewController3
    }
    
    public func dispatch(_ action: MiniAppAction) {
        
    }
    
    public required init(appId: String, superAppId: String) {
        self.appId = appId
        self.superAppId = superAppId
    }
}
