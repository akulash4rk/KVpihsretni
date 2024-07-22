//
//  FogView.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 22.07.2024.
//

import Foundation
import UIKit

class FogView : UIView {
    
    var fogView : UIView = UIView()
    
    var currentOpacity : Float = 0
    
    // MARK: - Properties
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        fogView = getFog()
        fogView.alpha = 1
       
        fogView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(fogView)
        
        NSLayoutConstraint.activate([
            fogView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -100),
            fogView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 100),
            fogView.centerYAnchor.constraint(equalTo: topAnchor, constant: -100),
            fogView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
    
}

extension FogView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        if let animation = anim as? CABasicAnimation, animation.keyPath == "opacity" {
            self.currentOpacity = animation.toValue as? Float ?? 0.0
        }
    }
}
