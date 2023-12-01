//
//  DetailViewController.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/22/23.
//

import UIKit

import SnapKit
import Then

final class DetailViewController: UIViewController {
    
    //MARK: - Properties
    
    var clubName = ""
    var clubID: Int = 1
    let detailRepository: DetailRepository
    
    //MARK: - UI Components
    
    private let rootView = DetailView()
    
    
    //MARK: - Life Cycle
    
    init(detailRepository: DetailRepository) {
        self.detailRepository = detailRepository
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

        requsetMainAPI()
        delegate()
    }
    
    private func delegate() {
        rootView.pageScrollView.delegate = self
    }
        
    private func requsetMainAPI() {
        Task {
            guard let data = await detailRepository.getDetailData(self.clubID) else {
                return
            }
            print(data)
            bindData(data: data)
        }
    }
    
    private func bindData(data: DetailModel) {
        rootView.do {
            $0.bannerImageView.bindData(data: data)
            $0.topView.bindData(data: data)
            $0.descriptionView.bindData(data: data)
            $0.albumView.bindData(data: data)
        }
        self.clubName = data.clubName
    }
    
    private func bindDummyData() {
        rootView.do {
            $0.bannerImageView.bindDummyData()
            $0.topView.bindDummyData()
            $0.descriptionView.bindDummyData()
            $0.albumView.bindDummyData()
        }
    }
}

extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        if offsetY <= 0 {
            UIView.animate(withDuration: 0.3) {
                self.navigationController?.navigationBar.topItem?.title = ""
            }
        } else if offsetY > 10{
            UIView.animate(withDuration: 0.3) {
                self.navigationController?.navigationBar.topItem?.title = self.clubName
            }
        }
    }
}
