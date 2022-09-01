//
//  WelcomeViewController.swift
//  MyMoney
//
//  Created by Felix Titov on 8/28/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    private var welcomeViewModel: WelcomeViewModelProtocol? {
        didSet {
            welcomeViewModel?.getSlides {
                self.slidesCollectionView.reloadData()
            }
        }
    }
    
    private lazy var nextActionButton: MainOperationButton = {
        let button = MainOperationButton(title: "Next", type: .standart)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var pageControll: UIPageControl = {
        let pageControll = UIPageControl()
        
        pageControll.numberOfPages = 3
        pageControll.currentPageIndicatorTintColor = .mainThemeColor
        pageControll.pageIndicatorTintColor = .systemGray4
        
        pageControll.addTarget(self, action: #selector(pageControllValueChanged), for: .valueChanged)
        
        return pageControll
    }()
    
    private lazy var slidesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout(scrollDirection: .horizontal)
        )
        collectionView.register(
            OnboardingCollectionViewCell.self,
            forCellWithReuseIdentifier: OnboardingCollectionViewCell.reuseID
        )
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeViewModel = WelcomeViewModel()
        
        view.backgroundColor = .systemBackground
        setupConstraints()
    }
    
    @objc
    private func pageControllValueChanged() {
        updatePageControllAndButton(with: pageControll.currentPage)
    }
    
    @objc
    private func nextButtonTapped() {
        pageControll.currentPage += 1
        updatePageControllAndButton(with: pageControll.currentPage)
    }
    
    private func setupConstraints() {
        view.addSubview(nextActionButton)
        view.addSubview(pageControll)
        view.addSubview(slidesCollectionView)
        
        nextActionButton.setupConstraints(superview: view, safeAreaLayoutGuide: view.safeAreaLayoutGuide)
        
        pageControll.snp.makeConstraints { make in
            make.bottom.equalTo(nextActionButton.snp.top).offset(-16)
            make.centerX.equalToSuperview()
        }
        
        slidesCollectionView.snp.makeConstraints { make in
            make.top.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(pageControll.snp.top)
        }
    }
    
    private func updatePageControllAndButton(with currentPage: Int) {
        if pageControll.currentPage == 2 {
            nextActionButton.setTitle("Get started", for: .normal)
        } else {
            nextActionButton.setTitle("Next", for: .normal)
        }
        
        let indexPath = IndexPath(item: currentPage, section: 0)
        slidesCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension WelcomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: slidesCollectionView.frame.width, height: slidesCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        pageControll.currentPage = Int(scrollView.contentOffset.x / width)
        
        updatePageControllAndButton(with: pageControll.currentPage)
    }
}

//MARK: - UICollectionViewDataSource
extension WelcomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        welcomeViewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = slidesCollectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.reuseID, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        cell.viewModel = welcomeViewModel?.slidesCellViewModel(at: indexPath)
        return cell
    }
}
