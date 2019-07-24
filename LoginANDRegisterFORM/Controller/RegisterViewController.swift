//
//  RegisterViewController.swift
//  LoginANDRegisterFORM
//
//  Created by Sopheap Sopheadavid on 7/22/19.
//  Copyright © 2019 Sopheap Sopheadavid. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet var viewTapped: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // To close keyboard when we tapped on somewhere on screen
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTap))
        viewTapped.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTap() {
        viewTapped.endEditing(true)
    }
    
    @IBAction func didPressedRegister(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        SVProgressHUD.show()
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                SVProgressHUD.showError(withStatus: "May have something wrong, try again!")
                print("Error")
                SVProgressHUD.dismiss()
            } else {
                SVProgressHUD.showSuccess(withStatus: "Account create successfully!")
                print("successfully")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToHome", sender: self)
            }
        }
    }
}
