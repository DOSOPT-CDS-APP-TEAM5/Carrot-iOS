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
    
    var clubId: Int? = nil
    
    //MARK: - UI Components
    
    private let rootView = DetailView()
    
    
    //MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
    }
    
    private func delegate() {
        
    }
    
    private func bindData() {
        let data = DetailModel.data[clubId ?? 0]
        
        rootView.do {
            $0.bannerImageView.bindData(data: data)
            $0.topView.bindData(data: data)
            $0.descriptionView.bindData(data: data)
            $0.albumView.bindData(data: data)
        }
    }
}
