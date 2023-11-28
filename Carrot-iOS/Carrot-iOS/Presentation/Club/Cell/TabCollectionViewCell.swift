//
//  TabCollectionViewCell.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/27/23.
//

import UIKit

import SnapKit
import Then

final class TabCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "TabCollectionViewCell"
    
    // MARK: - Properties
    
    private var segmentedControl = UISegmentedControl()
    private let bottomLineView = UIView()
    private let movingLineView = UIView()
    
    // MARK: - View Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSegmentedControl()
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

extension TabCollectionViewCell {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        bottomLineView.do {
            $0.backgroundColor = .grey100
        }
        
        movingLineView.do {
            $0.backgroundColor = .carrotBlack
        }
    }
    
    private func setLayout() {
        contentView.addSubviews(segmentedControl, movingLineView, bottomLineView)
        
        segmentedControl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        
        movingLineView.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.leading.equalTo(self.segmentedControl.snp.leading)
            $0.width.equalTo(45)
            $0.height.equalTo(2)
        }
        
        bottomLineView.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1.5)
        }
    }

    private func setupSegmentedControl() {
        segmentedControl.selectedSegmentTintColor = .clear
        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmentedControl.insertSegment(withTitle: "전체", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "운동", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "동네친구", at: 2, animated: true)
        segmentedControl.insertSegment(withTitle: "스터디", at: 3, animated: true)
        segmentedControl.insertSegment(withTitle: "가족/육아", at: 4, animated: true)
        segmentedControl.insertSegment(withTitle: "반려동물", at: 5, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.grey400,
            NSAttributedString.Key.font: UIFont.carrotSubtitle
        ], for: .normal)
        segmentedControl.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.carrotBlack,
            NSAttributedString.Key.font: UIFont.carrotSubtitle
        ], for: .selected)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        for index in 0..<segmentedControl.numberOfSegments {
            switch index {
            case 0:
                segmentedControl.setWidth(UIScreen.main.bounds.width * 44 / 375, forSegmentAt: 0)
            case 1:
                segmentedControl.setWidth(UIScreen.main.bounds.width * 44 / 375, forSegmentAt: 1)
            case 2:
                segmentedControl.setWidth(UIScreen.main.bounds.width * 66 / 375, forSegmentAt: 2)
            case 3:
                segmentedControl.setWidth(UIScreen.main.bounds.width * 56 / 375, forSegmentAt: 3)
            case 4:
                segmentedControl.setWidth(UIScreen.main.bounds.width * 66 / 375, forSegmentAt: 4)
            default:
                segmentedControl.setWidth(UIScreen.main.bounds.width * 66 / 375, forSegmentAt: 5)
            }
        }
    }

    @objc func segmentedControlValueChanged() {
        let selectedIndex = segmentedControl.selectedSegmentIndex
        lazy var width = segmentedControl.widthForSegment(at: selectedIndex)
        lazy var leadingDistance: CGFloat = 0.0
        for i in 0..<selectedIndex {
            leadingDistance += CGFloat(segmentedControl.widthForSegment(at: i))
        }
        UIView.animate(withDuration: 0.2, animations: {
            self.movingLineView.snp.updateConstraints {
                $0.leading.equalTo(self.segmentedControl.snp.leading).offset(leadingDistance)
                $0.width.equalTo(width)
            }
            self.layoutIfNeeded()
        })
    }
    
}
