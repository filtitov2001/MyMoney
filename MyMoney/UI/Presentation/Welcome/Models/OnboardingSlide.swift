//
//  OnboardingSlide.swift
//  MyMoney
//
//  Created by Felix Titov on 8/29/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import Foundation

struct OnboardingSlide {
    let title: String
    let description: String
    let image: String
    
    static func getSlides() -> [OnboardingSlide] {
        [
            OnboardingSlide(title: "Welcome to My Money!", description: "Application created for showing your incomes and outcomes.", image: "wallet1"),
            OnboardingSlide(title: "Control your expenses!", description: "Application created for showing your incomes and outcomes.", image: "wallet2"),
            OnboardingSlide(title: "See your stats!", description: "Application created for showing your incomes and outcomes.", image: "wallet3")
        ]
    }
}


