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
        if MiniApp1Manager.shared.permissions.contains(.notifications) {
            checkNotificationPermission()
        }
        // same for camera permission
    }
    
    private func checkNotificationPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { [weak self, center = notificationCenter] settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                DispatchQueue.main.async {
                    self?.statusLabel.text = "Not requested"
                }
                center.requestAuthorization { success, error in
                    DispatchQueue.main.async {
                        if error != nil {
                            self?.showAlert(title: "An error occur", message: "Request notification failed")
                            self?.statusLabel.text = "Request failed"
                        } else {
                            if success {
                                self?.statusLabel.text = "Permission authorized"
                                self?.registerSuperAppNotification()
                            } else {
                                self?.statusLabel.text = "Permission denied"
                            }
                        }
                    }
                }
            case .authorized:
                DispatchQueue.main.async {
                    self?.statusLabel.text = "Permission authorized"
                }
            case .denied:
                DispatchQueue.main.async {
                    self?.statusLabel.text = "Permission denied"
                }
            default:
                DispatchQueue.main.async {
                    self?.statusLabel.text = "Unknown"
                }
            }
        }
    }
    
    private func registerSuperAppNotification() {
        let superAppId = MiniApp1Manager.shared.superAppId
        registerRemoteNotification(with: superAppId)
    }
    
    private func registerRemoteNotification(with superAppId: String) {
        // call backend for notification registration
        // super app id used for determinding which app should be registered
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
