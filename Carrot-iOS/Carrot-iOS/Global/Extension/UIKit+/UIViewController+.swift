//
//  UIViewController+.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/20.
//

import UIKit

extension UIViewController{
 
    
//    func showToast(_ message: String,
//                   type: Toast.ToastType,
//                   view: UIView? = UIApplication.shared.firstWindow,
//                   bottomInset: CGFloat = 86) {
//        guard let view else { return }
//        Toast().show(message: message,
//                     type: type,
//                     view: view,
//                     bottomInset: bottomInset)
//    }
//
//    func showToast(_ toast: ToastCase, bottomInset: CGFloat = 86) {
//        guard let view = UIApplication.shared.firstWindow else { return }
//        Toast().show(message: toast.message,
//                     type: toast.type,
//                     view: view,
//                     bottomInset: bottomInset)
//    }
    
    
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification ,
                                               object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func addKeyboardNotifications(view: UIView){
        // 키보드가 나타날 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification ,
                                               object: view)
        // 키보드가 사라질 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: view)
    }

    // 노티피케이션을 제거하는 메서드
    func removeKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification ,
                                                  object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    func dismissKeyboardWhenTappedAround(cancelsTouchesInView: Bool = false) {
        print(#function)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = cancelsTouchesInView
        self.view.addGestureRecognizer(tap)
    }
    
    //MARK: - Action Method
    
    @objc private func keyboardWillShow(_ notification: NSNotification) {
        // 키보드의 높이만큼 화면을 올려준다.
        print("키보드 올라감")
        
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        if let view = notification.object as? UIView{
            view.frame.origin.y -= keyboardHeight
        }
        guard view.frame.origin.y == 0 else { return }
        self.view.frame.origin.y -= keyboardHeight
        Device.keyBoardHeight = keyboardHeight
    }

    // 키보드가 사라졌다는 알림을 받으면 실행할 메서드
    @objc private func keyboardWillHide(_ notification: NSNotification){
        // 키보드의 높이만큼 화면을 내려준다.
        print("키보드 내려감")
        
        if let view = notification.object as? UIView{
            view.frame.origin.y += Device.keyBoardHeight

        } else {
            guard view.frame.origin.y < 0 else { return }
            self.view.frame.origin.y += Device.keyBoardHeight
        }
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          dismissKeyboard()
    }
}


