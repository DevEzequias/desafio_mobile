//
//  AuthService.swift
//  iOSByCodersTecChallenge
//
//  Created by Ezequias Santos on 27/11/22.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
}

struct AuthService {
    static let shared = AuthService()
    
    func logUserIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func registerUser(credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
        
        let email = credentials.email
        let password = credentials.password
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("DEBUG: Error is \(error.localizedDescription)")
                        return
                    }
                    
                    guard let uid = result?.user.uid else {return}
                    
                    let values = ["email": email]
                    
                    REF_USERS.child(uid).updateChildValues(values)

                    }
                }
            }

