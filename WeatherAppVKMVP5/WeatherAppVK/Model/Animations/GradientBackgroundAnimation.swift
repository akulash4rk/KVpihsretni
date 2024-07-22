//
//  GradientBackground.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 21.07.2024.
//

import Foundation
import UIKit

class GradientBackgroundAnimation {
    
    let gradientLayer = CAGradientLayer()
    
    // MARK: - Animations
    
    func animateGradient(to willCollors: [CGColor]){
        self.gradientLayer.colors = gradientLayer.presentation()?.colors
        
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = self.gradientLayer.colors
        animation.toValue = willCollors
        animation.duration = 3
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        self.gradientLayer.colors = willCollors
        
        self.gradientLayer.add(animation, forKey: "colorTransition")
    }
}
