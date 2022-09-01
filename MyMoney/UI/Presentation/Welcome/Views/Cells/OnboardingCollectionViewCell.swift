//
//  OnboardingCollectionViewCell.swift
//  MyMoney
//
//  Created by Felix Titov on 8/29/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit
import SnapKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    static let reuseID = "OnboardingCollectionViewCell"
    
    weak var viewModel: OnboardingSlideCellViewModelProtocol? {
        didSet {
            if let viewModel = viewModel {
                setupCell(with: viewModel)
            }
        }
    }
    
    //MARK: - UI Prooperties
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var mainTitleLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: UIFont.SanFrancisco.bold.rawValue, size: UIFont.dynamicFontSize(25))
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: UIFont.SanFrancisco.regular.rawValue, size: UIFont.dynamicFontSize(17))
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainTitleLabel, descriptionLabel], axis: .vertical, spacing: 8)
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private functions
    private func setupCell(with viewModel: OnboardingSlideCellViewModelProtocol) {
        imageView.image = UIImage(named: viewModel.imageName)
        mainTitleLabel.text = viewModel.mainTitle
        descriptionLabel.text = viewModel.description
    }
    
    private func setupConstraints() {
        contentView.addSubview(labelsStackView)
        contentView.addSubview(imageView)
        
        labelsStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.bottom.equalToSuperview().offset(-16)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.bottom.equalTo(labelsStackView.snp.top)
        }
    }
}
