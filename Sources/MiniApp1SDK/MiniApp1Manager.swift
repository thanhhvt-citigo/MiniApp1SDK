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
    public func show(presentationType: MiniAppPresentationType, root: UIViewController, isNavigationControllerRequired: Bool) {
        guard let rootViewController = rootViewController else {
            return
        }
        switch presentationType {
        case .push:
            root.navigationController?.pushViewController(rootViewController, animated: true)
        case .present:
            let rootView: UIViewController = {
                return isNavigationControllerRequired ? UINavigationController(rootViewController: rootViewController) : rootViewController
            }()
            root.present(rootView, animated: true)
        }
    }
    
    public var appId: String
    
    public var delegate: MiniappDelegate?
    public var superAppId: String
 
    public var rootViewController: UIViewController? {
        return UIStoryboard.current.instantiateViewController(withIdentifier: "ViewController") as? ViewController
    }
    
    public func dispatch(_ action: MiniAppAction) {
        
    }
    
    public required init(appId: String, superAppId: String) {
        self.appId = appId
        self.superAppId = superAppId
    }
}

