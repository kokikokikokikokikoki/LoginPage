//
//  ViewController.swift
//  LoginPage
//
//  Created by Buratsakorn Petchdee on 1/2/2565 BE.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var labelMessage: UILabel!
    
    @IBOutlet weak var passwordError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
        //userEmail.layer.cornerRadius = 20
        
//        userEmail.delegate = self
//        passwordText.delegate = self
//        labelMessage.isHidden = true
        
    }
    func resetForm()
    {
        loginButton.isEnabled = false
        labelMessage.isHidden = true
//        passwordError.isHidden = true
        
        labelMessage.text = "Required"
//        passwordError.text = "Required"
        
        userEmail.text = ""
       // passwordText.text = ""
        
    }
    @IBAction func emailChanged(_ sender: Any) {
        
        if let email = userEmail.text
        {
            if let errorMessage = invalidEmail(value: email)
            {
                labelMessage.text = errorMessage
                labelMessage.isHidden = false
            }
            else{
                labelMessage.isHidden = true
            }
        }
        checkValidForm()
    }
    func invalidEmail(  value: String)-> String?{
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression )
        if !predicate.evaluate(with: value)
        {
            return "Invalid Email"
        }
        return nil
        
    }
    
    @IBAction func passwordChanged(_ sender: Any) {
        
        checkValidForm()
        
    }
    
func checkValidForm()
    {
        if labelMessage.isHidden
        {
            loginButton.isEnabled = true
        }else{
            loginButton.isEnabled = false
        }
    }
    
    @IBAction func loginTap(_ sender: Any) {
        
//        let email = userEmail.text
        
        
        resetForm()
        
        
        

    
    
    
    
}

//    @IBAction func emailChanged(_ sender: Any) {
//
//        if let email = userEmail.text
//        {
//            if let errorMessage = invalidEmail(value: email)
//            {
//                labelMessage.text = errorMessage
//                labelMessage.isHidden = false
//            }
//            else{
//                labelMessage.isHidden = true
//            }
//        }
//        checkValidForm()
//    }
//    func invalidEmail(  value: String)-> String?{
//        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression )
//        if !predicate.evaluate(with: value)
//        {
//            return "Invalid Email"
//        }
//        return nil
//
//    }
//
    
    
//    @IBAction func passwordError(_ sender: Any) {
//
//        if let password = passwordText.text
//        {
//            if let errorMessage = invalidPassword(value: password)
//            {
//                passwordError.text = errorMessage
//                passwordError.isHidden = false
//            }
//            else{
//                passwordError.isHidden = true
//            }
//        }
//        checkValidForm()
//
//    }
//
//    func invalidPassword(  value: String)-> String?{
//
//        if value.count < 8
//        {
//            return "Password must be atleast 8 char"
//        }
//        if containsDigits(value: value)
//        {
//            return "password must containt digits"
//     }
//        return nil
//
//    }
//    func containsDigits(value: String)-> Bool
//    {
//
//        let regularExpression = ".*[0-9].*"
//        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression )
//        return !predicate.evaluate(with: value)
//
//    }
    
}

