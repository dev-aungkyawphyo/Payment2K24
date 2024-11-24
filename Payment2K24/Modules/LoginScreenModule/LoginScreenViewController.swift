//
//  LoginScreenViewController.swift
//  Payment2K24
//
//  Created by Aung Kyaw Phyo on 21/11/2024.
//

import UIKit

class LoginScreenViewController: PaymentViewController {

    // MARK: - IBOutlets
    @IBOutlet var textFieldCollection: [PaymentTextField]!
    @IBOutlet var errorLabelCollection: [UILabel]!
    
    @IBOutlet weak var usernameTextField: PaymentTextField!
    @IBOutlet weak var passwordTextField: PaymentTextField!
    
    @IBOutlet weak var usernameErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    var user = User()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        textFieldSetup()
    }
    
    private func textFieldSetup() {
        textFieldCollection.forEach({
            $0.delegate = self
        })
    }
    
    // MARK: - User Interaction - Actions & Targets
    @IBAction func forgotPasswordBtnAction(_ sender: UIButton) {
        debugPrint("Pressed forgot btn")
        // TODO: Actions & Targets
    }
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        debugPrint("Pressed register btn")
        // TODO: Actions & Targets
    }
    
    @IBAction func clickedOnLoginButton(_ sender: PaymentButton) {
        if let user = user.login(username: usernameTextField.inputValue, password: passwordTextField.inputValue) {
            User.currentAccount = user
            baseRouter()
        } else {
            debugPrint("Login Failed")
            if User.currentAccount == nil {
                validationErrorService(error: ValidationErrors.usernameError)
                validationErrorService(error: ValidationErrors.passwordError)
            }
        }
    }
    
    private func baseRouter() {
        let vc = HomeScreenViewController.instantiate(storyboard: .baseRouter)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func validationErrorService(error: ValidationErrors) {
        if error == .usernameError {
            usernameErrorLabel.text = error.rawValue
        } else {
            passwordErrorLabel.text = error.rawValue
        }
    }
    
}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITextFieldDelegate
extension LoginScreenViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let textField = textField as? PaymentTextField, let index = textFieldCollection.firstIndex(of: textField) {
            errorLabelCollection[index].text = ""
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textField = textField as? PaymentTextField, 
                let index = textFieldCollection.firstIndex(of: textField) else {
            return true
        }
        guard index < textFieldCollection.count - 1 else {
            textFieldCollection[index].resignFirstResponder()
            return true
        }
        textFieldCollection[index + 1].becomeFirstResponder()
        return true
    }
    
}

