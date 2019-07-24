//
//  LoginViewController.swift
//  LoginANDRegisterFORM
//
//  Created by Sopheap Sopheadavid on 7/22/19.
//  Copyright © 2019 Sopheap Sopheadavid. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet var viewTapped: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTap))
        viewTapped.addGestureRecognizer(tapGesture)
        
    }
    @objc func viewTap() {
        
        viewTapped.endEditing(true)
        
    }
    
    @IBAction func didPressedLogin(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error != nil {
                SVProgressHUD.showError(withStatus: "Does not have this account, try again!")
                print("Error")
                SVProgressHUD.dismiss()
            } else {
                SVProgressHUD.showSuccess(withStatus: "Successfully")
                print("Successfully")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToHome", sender: self)
            }
        }
        
    }
    
}
