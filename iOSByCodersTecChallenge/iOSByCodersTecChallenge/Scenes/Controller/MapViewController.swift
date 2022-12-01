//
//  ViewController.swift
//  iOSByCodersTecChallenge
//
//  Created by Ezequias Santos on 27/11/22.
//

import UIKit
import FirebaseAuth

final class MainTabController: UIViewController {
    
    //MARK: - Properties
    
    private var user: User?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //logUserOut()
        view.backgroundColor = .red
        autheticatiteUserAndConfigureUI()
    }
    
    // MARK: API
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        UserService.shared.fetchUser(uid: uid) { user in
            self.user = user

        }
    }
    
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
