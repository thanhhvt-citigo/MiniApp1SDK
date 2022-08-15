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
        return UIApplication.shared.keyWindow?.rootViewController
    }
    
    public func dispatch(_ action: MiniAppAction) {
        
    }
    
    public required init(appId: String, superAppId: String) {
        self.appId = appId
        self.superAppId = superAppId
    }
}
