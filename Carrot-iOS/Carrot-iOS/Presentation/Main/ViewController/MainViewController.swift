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
    
    private let neighborhoodButton = UIBarButtonItem()
    private let iconStackView = UIBarButtonItem()
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
    }
    
    private func style() {
        navigationItem.do {
            $0.title = "날씨"
            $0.rightBarButtonItem = neighborhoodButton
            $0.leftBarButtonItem = iconStackView
        }
        
        self.navigationController?.navigationBar.do {
            $0.barTintColor = .black.withAlphaComponent(0.75)
            $0.prefersLargeTitles = true
            $0.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
        
        neighborhoodButton.do {
            $0.tintColor = .red
        }
        
        iconStackView.tintColor = .yellow
    }
    
}
