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
        
        delegate()
    }
    
    private func delegate() {
        rootView.moreClubView.dataSource = self
        rootView.moreClubView.delegate = self
        
        rootView.categoryView.dataSource = self
        rootView.categoryView.delegate = self
        
        rootView.postView.dataSource = self
        rootView.postView.delegate = self
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case rootView.moreClubView:
            return CGSize(width: 66, height: 99)
        case rootView.categoryView:
            let tmpLabel : UILabel = UILabel()
            tmpLabel.text = MainCategoryModel.categoryList[indexPath.item].text
            return CGSize(width: Int(tmpLabel.intrinsicContentSize.width) + 13, height: 33)
        case rootView.postView:
            return CGSize(width: 376, height: 127)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case rootView.moreClubView:
            return MainClubModel.clubList.count
        case rootView.categoryView:
            return MainCategoryModel.categoryList.count
        case rootView.postView:
            return 10
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case rootView.moreClubView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainMoreClubCollectionViewCell.cellIdentifier, for: indexPath) as? MainMoreClubCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(MainClubModel.clubList[indexPath.item])
            return cell
        case rootView.categoryView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCategoryCollectionViewCell.cellIdentifier, for: indexPath) as? MainCategoryCollectionViewCell else { return UICollectionViewCell() }
            cell.categoryLabel.text =  MainCategoryModel.categoryList[indexPath.item].text
            return cell
        case rootView.postView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPostCollectionViewCell.cellIdentifier, for: indexPath) as? MainPostCollectionViewCell else { return UICollectionViewCell() }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
