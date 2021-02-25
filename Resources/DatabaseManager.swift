//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Vasil Panov on 21.2.21.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    let database = Database.database().reference()
    //Mark: - Public
    
    //Check if username and email is available
    //-Parameters
    //  -email:String representing email
    //  -username:String representing username
    
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    
    /// Inserts new user data to database
    /// - Parameters:
    ///   - email: representing Users' email
    ///   - username: representing Users' username
    ///   - completion: Async callback for result if database entry succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void){
        database.child(email.safeDatabaseKey()).setValue(["username" : username]) { error, _ in
            if error == nil { 
                // succedded
                completion(true)
                return
            } else {
                //failed
                completion(false)
                return
            }
        }
    }
    
    // MARK: - Private
}

