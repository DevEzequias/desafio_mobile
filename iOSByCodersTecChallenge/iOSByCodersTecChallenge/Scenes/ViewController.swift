//
//  ViewController.swift
//  iOSByCodersTecChallenge
//
//  Created by Ezequias Santos on 27/11/22.
//

import UIKit
import FirebaseAuth

class MainTabController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //logUserOut()
        view.backgroundColor = .darkGray
        autheticatiteUserAndConfigureUI()
    }
    
    // MARK: API
    
    func autheticatiteUserAndConfigureUI() {
        if Auth.auth().currentUser == nil {
            print("DEBUG: User is not logged in..")
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            print("DEBUG: User is logged in..")
            
        }
    }
}
