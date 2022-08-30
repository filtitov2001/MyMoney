//
//  MainOperationButton.swift
//  MyMoney
//
//  Created by Felix Titov on 8/28/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//


import UIKit
import SnapKit

enum MainOperationButtonType {
    case standart
    case delete
}


class MainOperationButton: UIButton {
    
    // MARK: - Private prooperties
    private var title: String
    
    // MARK: - Initializers
    init(title: String, type: MainOperationButtonType) {
        self.title = title
        
        super.init(frame: .zero)
        setupButton(with: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal functions
    func setupConstraints(superview: UIView, safeAreaLayoutGuide: UILayoutGuide) {
        snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.078)
            make.leading.trailing.equalTo(superview).inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(16)
        }
    }
    
    
    func disable() {
        self.isEnabled = false
        self.backgroundColor = .systemGray
    }
    
    func enable() {
        self.isEnabled = true
        self.backgroundColor = #colorLiteral(red: 0.2605186105, green: 0.2605186105, blue: 0.2605186105, alpha: 1)
    }
    
    private func setupButton(with type: MainOperationButtonType) {
        
        switch type {
        case .standart:
            backgroundColor = #colorLiteral(red: 0.2605186105, green: 0.2605186105, blue: 0.2605186105, alpha: 1)
            setTitleColor(.white, for: .normal)
        case .delete:
            backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9529411765, blue: 0.9960784314, alpha: 1)
            setTitleColor(.black, for: .normal)
        }
        
        
        layer.cornerRadius = 10
        setTitle(title, for: .normal)
    }
}


//MARK: - SwiftUI
import SwiftUI

struct ViewControllerProvider: PreviewProvider {
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
