//
//  AllClubViewController.swift
//  Carrot-iOS
//
//  Created by 티모시 킴 on 11/23/23.
//

import UIKit

import SnapKit
import Then

class AllClubViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, _ in
        return self.createSectionLayout(section: sectionIndex)
    }))
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setCollectionViewConfig()
    }
    
}

// MARK: - Extensions

extension AllClubViewController {
    
    // MARK: - @Functions
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.do {
            $0.barTintColor = .white
            $0.shadowImage = UIImage()
        }
        
    }
    
    private func setLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(51)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
    private func setCollectionViewConfig() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: FilterCollectionViewCell.identifier)
        collectionView.register(TownClubCollectionViewCell.self, forCellWithReuseIdentifier: TownClubCollectionViewCell.identifier)
        collectionView.register(ViewAllFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ViewAllFooterView.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        collectionView.register(NewClubCollectionViewCell.self, forCellWithReuseIdentifier: NewClubCollectionViewCell.identifier)
        collectionView.register(HighlightCollectionViewCell.self, forCellWithReuseIdentifier: HighlightCollectionViewCell.identifier)
        collectionView.register(FarClubFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FarClubFooterView.identifier)
    }
    
    private func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
        switch section {
        case 0:
            return createFirstSectionLayout()
        case 1:
            return createSecondSectionLayout()
        case 2:
            return createThirdSectionLayout()
        default:
            return createDefaultLayout()
        }
    }
    
    private func createFirstSectionLayout() -> NSCollectionLayoutSection {
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let footerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(60))
        let footerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerItemSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        
        let firstGroup = createFirstSectionFirstGroupLayout()
        let secondGroup = createFirstSectionSecondGroupLayout()
        
        let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(280)), subitems: [firstGroup, secondGroup])
        
        let section = NSCollectionLayoutSection(group: containerGroup)
        section.boundarySupplementaryItems = [headerItem, footerItem]
        
        return section
    }
    
    private func createFirstSectionFirstGroupLayout() -> NSCollectionLayoutGroup {
        let filterItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40)))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(40))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [filterItem])
        return group
    }
    
    private func createFirstSectionSecondGroupLayout() -> NSCollectionLayoutGroup {
        let townClubItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(80)))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(240))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: townClubItem, count: 3)
        return group
    }
    
    private func createSecondSectionLayout() -> NSCollectionLayoutSection {
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let newClubItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(80)))
        
        let footerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(60))
        
        let footerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerItemSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(240)), subitems: [newClubItem])
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [headerItem, footerItem]
        return section
    }
    
    private func createThirdSectionLayout() -> NSCollectionLayoutSection {
        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(140))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
        
        let footerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(65))
        
        let footerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerItemSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.2), heightDimension: .absolute(160))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [headerItem, footerItem]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func createDefaultLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
}

extension AllClubViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 3
        case 2:
            return 4
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as! FilterCollectionViewCell
                return cell
            case 1, 2, 3:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TownClubCollectionViewCell.identifier, for: indexPath) as! TownClubCollectionViewCell
                return cell
            default:
                return UICollectionViewCell()
            }
        case 1:
            switch indexPath.row {
            case 0, 1, 2:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewClubCollectionViewCell.identifier, for: indexPath) as! NewClubCollectionViewCell
                return cell
            default:
                return UICollectionViewCell()
            }
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HighlightCollectionViewCell.identifier, for: indexPath) as! HighlightCollectionViewCell
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as! HeaderView
            switch indexPath.section {
            case 0:
                headerView.titleLabel.text = "우리동네 모임"
            case 1:
                headerView.titleLabel.text = "새로 생겼어요"
            case 2:
                headerView.titleLabel.text = "모임 하이라이트"
            default:
                break
            }
            return headerView
        case UICollectionView.elementKindSectionFooter:
            switch indexPath.section {
            case 0...1:
                let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ViewAllFooterView.identifier, for: indexPath) as! ViewAllFooterView
                return footerView
            case 2:
                let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FarClubFooterView.identifier, for: indexPath) as! FarClubFooterView
                return footerView
            default:
                return UICollectionReusableView()
            }
        default:
            return UICollectionReusableView()
        }
    }
    
}
