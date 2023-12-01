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
        
        delegate()
        requsetMainAPI()
    }
    
    private func delegate() {
        
    }
    
    private func requsetMainAPI() {
        Task {
            guard let data = await detailRepository.getDetailData(self.clubID) else {
                return
            }
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
