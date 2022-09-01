//
//  WelcomeViewModel.swift
//  MyMoney
//
//  Created by Felix Titov on 8/31/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import Foundation

protocol WelcomeViewModelProtocol: AnyObject {
    var numberOfItems: Int { get }
    func getSlides(completion: @escaping() -> Void)
    func slidesCellViewModel(at indexPath: IndexPath) -> OnboardingSlideCellViewModelProtocol
}

class WelcomeViewModel: WelcomeViewModelProtocol {
    
    private var slides: [OnboardingSlide] = []
    
    var numberOfItems: Int {
        slides.count
    }
    
    func getSlides(completion: @escaping () -> Void) {
        slides = OnboardingSlide.getSlides()
        completion()
    }
    
    func slidesCellViewModel(at indexPath: IndexPath) -> OnboardingSlideCellViewModelProtocol {
        let slide = slides[indexPath.row]
        return OnboardingSlideCellViewModel(onboardingSlide: slide)
    }
    
}
