//
//  DetailTableView.swift
//  Carrot-iOS
//
//  Created by 이윤학 on 11/23/23.
//

import UIKit

import SnapKit
import Then

final class DetailTableView: UITableView {
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
        register()
        self.style()
    
    }
        
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func register() {
        self.register(DetailTableViewAlbumCell.self, forCellReuseIdentifier: DetailTableViewAlbumCell.cellIdentifier)
    }
    
    private func style() {
        self.setBorder(borderWidth: 2, borderColor: .blue)
    }
}
