//
//  DatabaseManager.swift
//  InstagramApp
//
//  Created by 유준상 on 2021/03/23.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: - public
    /// check if username and email is available
    /// - Parameter
    ///     - email : String representing email
    ///     - username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: @escaping(Bool) -> Void){
        completion(true)
    }
    
    /// insert new user data to database
    /// - Parameter
    ///     - email : String representing email
    ///     - username: String representing username
    ///     - completion: Async callback for result if database entry succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping(Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { (error, _) in
            if error == nil {
                // succeded
                completion(true)
                return
            } else {
                // failed
                completion(false)
                return
            }
        }
    }
    
}
