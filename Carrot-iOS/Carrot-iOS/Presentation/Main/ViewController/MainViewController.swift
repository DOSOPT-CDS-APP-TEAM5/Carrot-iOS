//
//  MainViewController.swift
//  Carrot-iOS
//
//  Created by 류희재 on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class MainViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let rootView = MainView()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }    
}
