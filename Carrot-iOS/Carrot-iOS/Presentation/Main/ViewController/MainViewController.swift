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
    
    //MARK: - Properties
    
    let mainRepository: MainRepository
    var postData: [MainModel] = [] {
        didSet {
            rootView.postView.reloadData()
        }
    }
    
    //MARK: - UI Components
    
    private let rootView = MainView()
    
    //MARK: - Life Cycle
    
    init(mainRepository: MainRepository) {
        self.mainRepository = mainRepository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        requsetMainAPI()
    }
    
    private func delegate() {
        rootView.scrollView.delegate = self
        
        rootView.moreClubView.dataSource = self
        rootView.moreClubView.delegate = self
        
        rootView.categoryView.dataSource = self
        rootView.categoryView.delegate = self
        
        rootView.postView.dataSource = self
        rootView.postView.delegate = self
    }
    
    private func requsetMainAPI(_ category: String? = nil) {
        Task {
            let tag: String? = (category == "주제") ? nil : category
            postData = try await mainRepository.getMainData(tag)
        }
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
            return postData.count
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
            if !postData.isEmpty {
                cell.dataBind(postData[indexPath.item])
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        requsetMainAPI(MainCategoryModel.categoryList[indexPath.item].text)
    }
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateFloatingButtonLayout(scrollView.contentOffset.y == 0 )
    }
}

extension MainViewController {
    func updateFloatingButtonLayout(_ isTop: Bool) {
        self.rootView.floatingButton.writeLabel.isHidden = !isTop
        UIView.animate(withDuration: 0.2, animations: {
            if isTop {
                self.rootView.floatingButton.writeLabel.alpha = 1.0
                self.rootView.floatingButton.snp.remakeConstraints {
                    $0.bottom.equalToSuperview().inset(133)
                    $0.trailing.equalToSuperview().inset(15)
                    $0.width.equalTo(89)
                    $0.height.equalTo(48)
                }
                
                self.rootView.floatingButton.stackView.snp.remakeConstraints {
                    $0.leading.trailing.equalToSuperview().inset(13)
                    $0.top.bottom.equalToSuperview().inset(14)
                }
            } else {
                self.rootView.floatingButton.writeLabel.alpha = 0.0
                self.rootView.floatingButton.snp.remakeConstraints {
                    $0.bottom.equalToSuperview().inset(133)
                    $0.trailing.equalToSuperview().inset(15)
                    $0.size.equalTo(48)
                }
                self.rootView.floatingButton.stackView.snp.remakeConstraints {
                    $0.center.equalToSuperview()
                    $0.top.leading.equalToSuperview().inset(6)
                }
            }
            self.rootView.floatingButton.layoutIfNeeded()
        }, completion: nil)
    }
}
