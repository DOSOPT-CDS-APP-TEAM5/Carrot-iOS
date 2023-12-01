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
                
                selectLine.snp.remakeConstraints {
                    $0.leading.equalTo(buttons[index].snp.leading)
                    $0.width.equalToSuperview().dividedBy(4)
                    $0.bottom.equalToSuperview().offset(0.75)
                    $0.height.equalTo(1.5)
                }
                UIView.animate(withDuration: 0.2) {
                    self.layoutIfNeeded()
                }
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
    
    private let backgroundLine = UIView()
    private let selectLine = UIView()

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
            }
        }
        
        backgroundLine.do {
            $0.backgroundColor = .grey100
        }
        
        selectLine.do {
            $0.backgroundColor = .grey500
        }
        
    }
    
    private func hieararchy() {
        self.addSubviews(
            horizontalStackView, backgroundLine, selectLine
        )
        
        horizontalStackView.addArrangedSubViews(
            button1, button2, button3, button4
        )
    }
    
    private func layout() {
        horizontalStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(36)
        }
        
        backgroundLine.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().offset(0.75)
            $0.height.equalTo(1.5)
        }
        
        selectLine.snp.makeConstraints {
            $0.leading.equalTo(buttons[index].snp.leading)
            $0.width.equalToSuperview().dividedBy(4)
            $0.bottom.equalToSuperview().offset(0.75)
            $0.height.equalTo(1.5)
        }
        
    }

    @objc func tap(_ sender: UIButton) {
        index = sender.tag
    }
}
