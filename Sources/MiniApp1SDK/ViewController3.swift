//
//  ViewController3.swift
//  MiniApp1
//
//  Created by thanh tien on 15/08/2022.
//

import UIKit
import NotificationCenter

class ViewController3: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "VC3"
        checkNotificationPermission()
    }
    
    private func checkNotificationPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { [weak self, center = notificationCenter] settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                self?.statusLabel.text = "Not requested"
                center.requestAuthorization { success, error in
                    if error != nil {
                        self?.showAlert(title: "An error occur", message: "Request notification failed")
                        self?.statusLabel.text = "Request failed"
                    }
                    self?.statusLabel.text = success ? "Permission authorized" : "Permission denied"
                }
            case .authorized:
                self?.statusLabel.text = "Permission authorized"
            case .denied:
                self?.statusLabel.text = "Permission denied"
            default:
                self?.statusLabel.text = "Unknown"
            }
        }
    }
    
    @IBAction func showVC4Action(_ sender: Any) {
        guard let vc4 = UIStoryboard.current.instantiateViewController(withIdentifier: "ViewController4") as? ViewController4 else {
            return
        }
        
        navigationController?.pushViewController(vc4, animated: true)
    }
    
    deinit {
        print("View Controller 3 deinit")
    }
}
