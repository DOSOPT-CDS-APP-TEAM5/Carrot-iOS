//
//  DetailCustomTabBar.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/23/23.
//

import UIKit

import SnapKit
import Then

final class DetailCustomTabBar: UIView {
    
    // MARK: - Properties
    
    private var index = 0 {
        didSet {
            buttons.forEach {
                $0.isSelected = $0.tag == index
                $0.addBottomBorder(with: $0.tag == self.index ? .grey500 : .grey100, andWidth: 1.5)
            }
        }
    }
    private let buttonTitles = ["전체", "앨범", "일정", "게시판"]
    private lazy var buttons = [button1, button2, button3, button4]
    
    // MARK: - UI Components
    
    private let horizontalStackView = UIStackView()

    private let button1 = UIButton()
    private let button2 = UIButton()
    private let button3 = UIButton()
    private let button4 = UIButton()

    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hieararchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func style() {
        horizontalStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
        }
        
        for i in 0..<buttons.count {
            buttons[i].do {
                $0.tag = i
                $0.isSelected = i == index
                $0.setTitle(buttonTitles[i], for: .normal)
                $0.titleLabel?.font = .carrotSubtitle
                
                $0.setTitleColor(.grey400, for: .normal)
                $0.setTitleColor(.carrotBlack, for: .selected)
                $0.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
                $0.addBottomBorder(with: i == index ? .grey500 : .grey100, andWidth: 1.5)
            }
        }
    }
    
    private func hieararchy() {
        self.addSubviews(horizontalStackView)
        
        horizontalStackView.addArrangedSubViews(
            button1, button2, button3, button4
        )
    }
    
    private func layout() {
        horizontalStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(36)
        }
    }
    


    @objc func tap(_ sender: UIButton) {
        index = sender.tag
    }
}
