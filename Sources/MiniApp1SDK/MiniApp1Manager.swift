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
    public static var shared: MiniApp1Manager!
    
    public static func createInstance(appId: String, superAppId: String, permissions: [MiniAppPermissionScope.RawValue]) -> MiniApp1Manager {
        shared = .init(appId: appId, superAppId: superAppId, permissions: permissions)
        return shared
    }
    
    public required init(appId: String, superAppId: String, permissions: [MiniAppPermissionScope.RawValue]) {
        self.appId = appId
        self.superAppId = superAppId
        request(permissions: permissions)
    }
    
    private func request(permissions: [MiniAppPermissionScope.RawValue]) {
        // request all permissions here
    }
    
    struct PresentationStyle {
        let type: MiniAppPresentationType
        let root: UIViewController
    }
    
    public func show(presentationType: MiniAppPresentationType, root: UIViewController) {
        guard let rootViewController = rootViewController else {
            return
        }
        self.presentationStyle = PresentationStyle(type: presentationType, root: root)
        switch presentationType {
        case .push:
            if let navigationController = (rootViewController as? UINavigationController) {
                if let firstVC = navigationController.viewControllers.first {
                    root.navigationController?.pushViewController(firstVC, animated: true)
                }
            } else {
                root.navigationController?.pushViewController(rootViewController, animated: true)
            }
        case .present:
            root.present(rootViewController, animated: true)
        }
    }
    
    private var presentationStyle: PresentationStyle?
    
    public var appId: String
    
    public var delegate: MiniappDelegate?
    public var superAppId: String
 
    public var rootViewController: UIViewController? {
        guard let vc = UIStoryboard.current.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            return nil
        }
        return UINavigationController(rootViewController: vc)
    }
    
    public func dismiss(completion: (() -> Void)?) {
        guard let presentationStyle = presentationStyle else {
            return
        }
        presentationStyle.root.dismiss(animated: true, completion: {
            self.presentationStyle?.root.navigationController?.popToViewController(presentationStyle.root, animated: true)
            completion?()
        })
    }
    
    public func dispatch(_ action: MiniAppAction) {
        
    }
}

