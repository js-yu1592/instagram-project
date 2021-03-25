//
//  ViewController.swift
//  InstagramApp
//
//  Created by 유준상 on 2021/03/11.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("HomeViewController - viewDidLoad() called")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print("failed to sign out")
//        }
    }
    
    private func handleNotAuthenticated() {
        // check auth status
        if Auth.auth().currentUser == nil {
            // show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false, completion: nil)
        }
    }

}

