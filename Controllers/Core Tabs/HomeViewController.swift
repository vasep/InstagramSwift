//
//  ViewController.swift
//  Instagram
//
//  Created by Vasil Panov on 20.2.21.
//
import FirebaseAuth
import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
        
        do {
            try Auth.auth().signOut()
        } catch {
            
        }

    }
    
    private func handleNotAuthenticated(){
        //Check auth status
        if Auth.auth().currentUser == nil {
            //Show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
}

