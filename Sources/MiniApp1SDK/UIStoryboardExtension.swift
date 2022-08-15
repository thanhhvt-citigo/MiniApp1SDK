//
//  File.swift
//  
//
//  Created by thanh tien on 15/08/2022.
//

import Foundation
import UIKit

extension UIStoryboard {
    static var current: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.module)
    }
}
