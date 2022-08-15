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
    struct PresentationStyle {
        let type: MiniAppPresentationType
        let root: UIViewController
    }
    
    public func show(presentationType: MiniAppPresentationType, root: UIViewController, isNavigationControllerRequired: Bool) {
        guard let rootViewController = rootViewController else {
            return
        }
        self.presentationStyle = PresentationStyle(type: presentationType, root: root)
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
    
    private var presentationStyle: PresentationStyle?
    
    public var appId: String
    
    public var delegate: MiniappDelegate?
    public var superAppId: String
 
    public var rootViewController: UIViewController? {
        return UIStoryboard.current.instantiateViewController(withIdentifier: "ViewController") as? ViewController
    }
    
    public required init(appId: String, superAppId: String) {
        self.appId = appId
        self.superAppId = superAppId
    }
    
    public func dismiss(completion: (() -> Void)?) {
        guard let presentationStyle = presentationStyle else {
            return
        }
        rootViewController?.dismiss(animated: true, completion: {
            self.rootViewController?.navigationController?.popToViewController(presentationStyle.root, animated: true)
            completion?()
        })
    }
    
    public func dispatch(_ action: MiniAppAction) {
        
    }
}

