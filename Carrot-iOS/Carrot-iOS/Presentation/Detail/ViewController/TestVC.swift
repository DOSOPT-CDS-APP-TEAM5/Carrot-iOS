//
//  TestVC.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 12/1/23.
//

import UIKit

import SnapKit
import Then

final class TestVC: UIViewController {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    let button = UIButton()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }
    private func layout() {
        view.addSubview(button)
        
        button.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    private func style() {
        self.view.backgroundColor = .white
        button.do {
            $0.setTitle("GO", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.addTarget(self, action: #selector(navigationpush), for: .touchUpInside)
        }
    }
    
    @objc func navigationpush() {
        let detailVC = DetailViewController(
            detailRepository: DefaultDetailRepository(
                detailService: DefaultDetailService()))
        detailVC.clubID = 1
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
