//
//  SignUpViewController.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/18/23.
//

import UIKit

import SnapKit
import Then

final class SignUpViewController: UIViewController {
    
    //MARK: - Properties
    
    var nickNameCheck: Bool = false
    var introduceCheck: Bool = false
    
    var signUpAvailable: Bool {
        return nickNameCheck && introduceCheck
    }
    //MARK: - UI Components
    
    private let rootView = SignUpView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
    }
    
    private func delegate() {
        rootView.introduceTextView.delegate = self
        rootView.nameTextField.delegate = self
    }
}

extension SignUpViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == nil {
            rootView.introducePlaceHolderLabel.isHidden = false
        } else {
            rootView.introducePlaceHolderLabel.isHidden = true
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            rootView.introducePlaceHolderLabel.isHidden = false
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {return false}
        let newString = currentText.replacingCharacters(in: stringRange, with: text)
        
        let characterCount = newString.count
        guard characterCount <= 200 else { return false }
        
        introduceCheck = characterCount > 0
        rootView.updateintroduceCntLabel(characterCount: characterCount)
        rootView.updateSignUpButton(available: signUpAvailable)
        
        return true
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else {return false}
        let newString = currentText.replacingCharacters(in: stringRange, with: string)
        
        let characterCount = newString.count
        guard characterCount <= 12 else { return false }
        
        nickNameCheck = characterCount > 0
        rootView.updatenameCntLabel(characterCount: characterCount)
        rootView.updateSignUpButton(available: signUpAvailable)
        return true
    }
    
}
