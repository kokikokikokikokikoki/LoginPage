//
//  ViewController.swift
//  LoginPage
//
//  Created by Buratsakorn Petchdee on 1/2/2565 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var labelMessage: UILabel!
    
    @IBOutlet weak var passwordError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userEmail.delegate = self
        passwordText.delegate = self
        resetForm()
    }

    func resetForm() {
        labelMessage.isHidden = true
        passwordError.isHidden = true
        labelMessage.text = "Required"
        userEmail.text = ""
    }

    func isValidEmail(email: String) -> Bool {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression )
        return predicate.evaluate(with: email)
    }

    @IBAction func loginTap(_ sender: Any) {
        if userEmail.text?.isEmpty ?? false {
            labelMessage.text = "Required"
            labelMessage.isHidden = false
            return
        }
        else if !isValidEmail(email: userEmail.text ?? "") {
            labelMessage.text = "Invalid email"
            labelMessage.isHidden = false
            return
        }
        labelMessage.isHidden = true
        redirectToWelcomeScreen()
    }

    private func redirectToWelcomeScreen() {
        print("redirectToWelcomeScreen")
    }

    private func validateUsername() {
        if userEmail.text?.isEmpty ?? false {
            labelMessage.text = "Required"
            labelMessage.isHidden = false
        }
        else if !isValidEmail(email: userEmail.text ?? "") {
            labelMessage.text = "Invalid email"
            labelMessage.isHidden = false
        } else {
            labelMessage.isHidden = true
        }
    }

    private func validatePassword() {
        if passwordText.text?.isEmpty ?? false {
            passwordError.text = "Required"
            passwordError.isHidden = false
        }
        else if passwordText.text?.count ?? 0 < 6 {
            passwordError.text = "Required more than 6 charactor"
            passwordError.isHidden = false
        } else {
            passwordError.isHidden = true
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        validateUsername()
        validatePassword()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}



