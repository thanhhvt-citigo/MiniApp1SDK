//
//  File.swift
//  
//
//  Created by thanh tien on 15/08/2022.
//

import Foundation
import KVStandardConnection
import UIKit

public class MiniApp1Manager: MiniApp {
    public var appId: String
    
    public var delegate: MiniappDelegate?
    public var superAppId: String
 
    public var rootViewController: UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
    }
    
    public func dispatch(_ action: MiniAppAction) {
        
    }
    
    public required init(appId: String, superAppId: String) {
        self.appId = appId
        self.superAppId = superAppId
    }
}

