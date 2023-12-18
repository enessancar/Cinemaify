//
//  AuthViewModel.swift
//  Cinemaify
//
//  Created by Enes Sancar on 17.12.2023.
//

import FirebaseAuth
import FirebaseFirestore

final class AuthViewModel {
    
    func login(email: String,
               password: String,
               completion: @escaping(Bool, String) -> ()) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                completion(false, error.localizedDescription)
            } else {
                completion(true, "Success login")
            }
        }
    }
    
    func register(userName: String,
                  email: String, password: String,
                  completion: @escaping (Bool, String) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error {
                print(error.localizedDescription)
            } else {
                guard let user = result?.user else {
                    return
                }
                let firestore = Firestore.firestore()
                
                let userDictionary =  ["userName": userName] as! [String: Any]
                
                firestore.collection("UsersInfo")
                    .document(user.uid)
                    .setData(userDictionary) { error in
                        if let error {
                            print(error.localizedDescription)
                        }
                        completion(true, "Registration successfull")
                    }
            }
        }
    }
    
    func resetPassword(email: String,
                       completion: @escaping(Bool, String) -> Void) {
        
        guard !email.isEmpty else {
            completion(false, "E mail is empty")
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error {
                completion(false, "Reset password error \(error.localizedDescription)")
            } else {
                completion(true, "Reset password operation success")
            }
        }
    }
    
    func changePassword(password: String,
                        completion: @escaping(Bool, String) -> ()) {
        
        guard !password.isEmpty else {
            completion(false, "Parola alanı boş bırakılmaz")
            return
        }
        
        Auth.auth().currentUser?.updatePassword(to: password, completion: { error in
            if let error {
                completion(false, "Update password failed")
                return
            } else {
                completion(true, "Password update operation success")
            }
        })
    }
}
