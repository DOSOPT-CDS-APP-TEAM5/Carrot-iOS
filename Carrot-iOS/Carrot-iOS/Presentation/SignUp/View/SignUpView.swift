//
//  SignUpView.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/18/23.
//

import UIKit

import SnapKit
import Then

final class SignUpView: UIView {
    
    // MARK: - Properties
    
    let backButton = UIButton()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let profileImageView = UIImageView(image: Image.profile)
    
    private let nameLabel = UILabel()
    private let nameTextField = UITextField()
    private let nameCntLabel = UILabel()
    
    private let introduceTextView = UITextView()
    private let introduceLabel = UILabel()
    private let introduceCntLabel = UILabel()
    
    let signUpButton = UIButton()
    
    
    // MARK: - UI Components
    
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
        backButton.do {
            $0.setImage(Image.navigationLeft, for: .normal)
        }
        titleLabel.do {
            $0.text = "먼저 모임 프로필을\n만들어주세요"
            $0.textColor = .carrotBlack
            $0.font = .carrotTitleHead
            $0.textAlignment = .left
            $0.numberOfLines = 2
        }
        descriptionLabel.do {
            $0.text = "모든 모임에서 동일하게 사용하는 프로필이에요."
            $0.textColor = .carrotBlack
            $0.font = .carrotInfo
            $0.textAlignment = .left
        }
        nameLabel.do {
            $0.text = "닉네임"
            $0.textColor = .carrotBlack
            $0.font = .carrotSubtitle
            $0.textAlignment = .center
        }
        
        nameTextField.do {
            $0.placeholder = "닉네임을 입력해주세요."
            $0.addLeftPadding(inset: 15)
            $0.setPlaceholderColor(color: .grey400)
            $0.makeCornerRound(radius: 5)
            $0.setBorder(borderWidth: 1, borderColor: .grey400)
        }
        nameCntLabel.do {
            $0.text = "0/12"
            $0.textColor = .grey400
            $0.textAlignment = .left
            $0.font = .carrotBodyNumber
        }
        
        introduceLabel.do {
            $0.text = "닉네임"
            $0.textColor = .carrotBlack
            $0.font = .carrotSubtitle
            $0.textAlignment = .center
        }
        introduceTextView.do {
            $0.text = "닉네임을 입력해주세요."
//            $0.setPlaceholderColor(color: .grey400)
            $0.makeCornerRound(radius: 5)
            $0.setBorder(borderWidth: 1, borderColor: .grey400)
        }
        
        introduceCntLabel.do {
            $0.text = "0/200"
            $0.textColor = .grey400
            $0.textAlignment = .left
            $0.font = .carrotBodyNumber
        }
        
//        signUpButton.do {
////            $0.setTitle("", for: <#T##UIControl.State#>)
//        }
    }
    
    private func hieararchy() {
        self.addSubviews(
            backButton,
            titleLabel,
            descriptionLabel,
            profileImageView,
            nameLabel,
            nameTextField,
            nameCntLabel
//            introduceTextView,
//            introduceLabel,
//            introduceCntLabel,
//            signUpButton
//
//
        )
    }
    
    private func layout() {
        backButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(5)
            $0.leading.equalToSuperview()
            $0.width.equalTo(48)
            $0.height.equalTo(36)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.backButton.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(187)
            $0.height.equalTo(60)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(titleLabel)
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(212)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(94)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(51)
            $0.leading.equalToSuperview().offset(7)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(7)
            $0.trailing.equalToSuperview().inset(23)
            $0.height.equalTo(54)
        }
        
        nameCntLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(23)
            $0.top.equalTo(nameTextField.snp.bottom).offset(2)
        }
        
    }
}





