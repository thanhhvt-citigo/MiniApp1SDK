//
//  File.swift
//  
//
//  Created by thanh tien on 16/08/2022.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, action: (() -> Void)? = nil, cancel: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            cancel?()
        })
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            action?()
        })
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
