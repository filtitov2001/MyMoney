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
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
    
        imageView.image = UIImage(named: "wallet3")
        return imageView
    }()
    
    private lazy var mainTitleLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.text = "Welcome to My Money!"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.text = "Application created for showing your incomes and outcomes."
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainTitleLabel, descriptionLabel], axis: .vertical, spacing: 8)
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with model: OnboardingSlide) {
        imageView.image = UIImage(named: model.image)
        mainTitleLabel.text = model.title
        descriptionLabel.text = model.description
    }
    
    private func setupConstraints() {
        contentView.addSubview(labelsStackView)
        
        labelsStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.bottom.equalToSuperview().offset(-16)
        }
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.bottom.equalTo(labelsStackView.snp.top)
        }
    }
}

//MARK: - SwiftUI
import SwiftUI

struct WelcomeViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
            .previewDisplayName("iPhone 13")
            .edgesIgnoringSafeArea(.all)

        ContainerView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (1st generation)"))
            .previewDisplayName("iPhone SE (1st generation)")
            .edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let viewController = WelcomeViewController()

        func makeUIViewController(context: Context) -> some WelcomeViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
