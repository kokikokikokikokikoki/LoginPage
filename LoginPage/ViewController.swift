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
    var isAlreadyClickLogin: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userEmail.delegate = self
        passwordText.delegate = self
        resetForm()
    }

    func resetForm() {
        labelMessage.isHidden = true
        passwordError.isHidden = true
    }

    func isValidEmail(email: String) -> Bool {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression )
        return predicate.evaluate(with: email)
    }

    @IBAction func loginTap(_ sender: Any) {
        isAlreadyClickLogin = true
        
        let email = validateEmail(message: userEmail.text ?? "")
        let password = validatePassword(message: passwordText.text ?? "")
        if email.0 == false || password.0 == false {
            manageErrorMessage(label: labelMessage, message: email.1, isHidden: email.0)
            manageErrorMessage(label: passwordError, message: password.1, isHidden: password.0)
            return
        }
        
        labelMessage.isHidden = true
        passwordError.isHidden = true
        redirectToWelcomeScreen()
    }

    private func redirectToWelcomeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let welcomeScreen = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
//        self.navigationController?.pushViewController(welcomeScreen, animated: true)
//        welcomeScreen.modalPresentationStyle = .fullScreen
        self.present(welcomeScreen, animated: true, completion: nil)
        
    }

    private func validateEmail(message: String) -> (Bool, String) {
        if message.isEmpty {
            return (false, "Required")
        }
        if !isValidEmail(email: message) {
            return (false, "Invalid email")
        }
        
        return (true, "Correct")
    }
    
    private func validatePassword(message: String) -> (Bool, String) {
        if message.isEmpty {
            return (false, "Required")
        }
        if message.count < 6 {
            return (false, "Password should more than 6 charactor")
        }
        
        return (true, "Correct")
    }
    
    private func manageErrorMessage() {
        let email = validateEmail(message: userEmail.text ?? "")
        let password = validatePassword(message: passwordText.text ?? "")
        manageErrorMessage(label: labelMessage, message: email.1, isHidden: email.0)
        manageErrorMessage(label: passwordError, message: password.1, isHidden: password.0)
    }
    
    private func manageErrorMessage(label: UILabel, message: String, isHidden: Bool) {
        label.text = message
        label.isHidden = isHidden
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isAlreadyClickLogin {
            manageErrorMessage()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
