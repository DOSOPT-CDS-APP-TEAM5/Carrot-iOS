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
        
    }
}



