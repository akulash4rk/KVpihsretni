//
//  SunsetSunriseView.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 17.07.2024.
//

import Foundation
import UIKit

class SunsetSunriseView: UIView {
    
    // MARK: - Properties
     var currentPositionY : CGFloat = 0
     var currentPositionX : CGFloat = 0
    
        let sunImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "sun"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Initializators
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup View
    
    private func setupView() {
        addSubview(sunImageView)
        
        NSLayoutConstraint.activate([
            sunImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            sunImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            sunImageView.widthAnchor.constraint(equalToConstant: 1000),
            sunImageView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
}
    // MARK: - Animation

extension SunsetSunriseView {
//    
//    func animateIn() {
//        
//        stopAnimation()
//        
//        let sunAnimationY = CAKeyframeAnimation(keyPath: "position.y")
//        sunAnimationY.values = [currentPositionY, -50]
//        
//        let sunAnimationX = CAKeyframeAnimation(keyPath: "position.x")
//        sunAnimationX.values = [currentPositionX, bounds.width + 50]
//        
//
//        
//        sunAnimationY.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        sunAnimationX.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        
//        let mainAnimationGroup = CAAnimationGroup()
//        mainAnimationGroup.animations = [sunAnimationY, sunAnimationX]
//        mainAnimationGroup.duration = 5
//        mainAnimationGroup.fillMode = .forwards
//        mainAnimationGroup.isRemovedOnCompletion = false
//        sunImageView.layer.add(mainAnimationGroup, forKey: "mainAnimations")
//
//    }
//    
//    
//    func animateOut() {
//
//        stopAnimation()
//        
//        let sunAnimationY = CAKeyframeAnimation(keyPath: "position.y")
//        sunAnimationY.values = [currentPositionY, bounds.height + 200]
//        
//        let sunAnimationX = CAKeyframeAnimation(keyPath: "position.x")
//        sunAnimationX.values = [currentPositionX, bounds.width + 800]
//        
//        
//        let sunAnimationRotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
//        
//        let rotationAngle = atan2(Double(bounds.height + 200), Double(bounds.width))
//        
//        sunAnimationRotation.values = [currentRotation, rotationAngle + .pi / 4]
//        
//        sunAnimationY.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        sunAnimationX.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        sunAnimationRotation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        
//        
//        let mainAnimationGroup = CAAnimationGroup()
//        mainAnimationGroup.animations = [sunAnimationY, sunAnimationX]
//        mainAnimationGroup.duration = 5
//        mainAnimationGroup.fillMode = .forwards
//        mainAnimationGroup.isRemovedOnCompletion = false
//        
//        sunImageView.layer.add(mainAnimationGroup, forKey: "mainAnimations")
//    }
//    
//    
//    func stopAnimation() {
//
//        currentPositionX = sunImageView.layer.presentation()?.position.x ?? 0.0
//        currentPositionY = sunImageView.layer.presentation()?.position.y ?? 0.0
//        let currentTransform = sunImageView.layer.presentation()?.transform
//        currentRotation = atan2(currentTransform?.m12 ?? 0.0, currentTransform?.m11 ?? 0.0)
//
//        
//        sunImageView.layer.position.y = currentPositionY
//        sunImageView.layer.position.x = currentPositionX
//        sunImageView.layer.transform.m12 = currentRotation
//        
//            
//        sunImageView.layer.setValue(currentPositionY, forKeyPath: "position.y")
//        sunImageView.layer.setValue(currentPositionX, forKeyPath: "position.x")
//        sunImageView.layer.setValue(currentRotation, forKeyPath: "transform.rotation.z")
//            
//        sunImageView.layer.removeAnimation(forKey: "mainAnimations")
//        
//    }
}
