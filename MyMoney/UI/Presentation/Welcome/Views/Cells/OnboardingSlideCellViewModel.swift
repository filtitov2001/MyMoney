//
//  OnboardingSlideCellViewModel.swift
//  MyMoney
//
//  Created by Felix Titov on 8/31/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import Foundation

protocol OnboardingSlideCellViewModelProtocol: AnyObject {
    var mainTitle: String { get }
    var description: String { get }
    var imageName: String { get }
    
    init(onboardingSlide: OnboardingSlide)
}

class OnboardingSlideCellViewModel: OnboardingSlideCellViewModelProtocol {
    
    private let onboardingSlide: OnboardingSlide
    
    var mainTitle: String {
        onboardingSlide.title
    }
    
    var description: String {
        onboardingSlide.description
    }
    
    var imageName: String {
        onboardingSlide.image
    }
    
    required init(onboardingSlide: OnboardingSlide) {
        self.onboardingSlide = onboardingSlide
    }
    
}

