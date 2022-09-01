//
//  Extension + UIFont.swift
//  MyMoney
//
//  Created by Felix Titov on 8/31/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit

extension UIFont {
    
    enum SanFrancisco: String {
        case semibold = "SFProRounded-Semibold"
        case regular = "SFProRounded-Regular"
        case black = "SFProRounded-Black"
        case light = "SFProRounded-Light"
        case thin = "SFProRounded-Thin"
        case medium = "SFProRounded-Medium"
        case ultralight = "SFProRounded-Ultralight"
        case heavy = "SFProRounded-Heavy"
        case bold = "SFProRounded-Bold"
        
    }
    
    static func dynamicFontSize(_ fontSize: CGFloat) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.size.width
        let calculatedFontSize = screenWidth / 360 * fontSize
        return calculatedFontSize
    }
}
