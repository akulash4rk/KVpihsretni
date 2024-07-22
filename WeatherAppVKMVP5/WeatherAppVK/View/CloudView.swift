//
//  CloudView.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 18.07.2024.
//

import Foundation
import UIKit


class CloudView: UIView {
    
    // MARK: - Properties
    
    var sky1 : UIView = UIView()
    
    let animate : CloudWeatherAnimations = CloudWeatherAnimations()
    weak var rainView : RainParticleView? = nil
    weak var snowView : SnowView? = nil
    weak var stormView : ThunderstormView? = nil
    
    private var timer: Timer?
    
    var currentPosition: CGFloat = 0
    var currentOpacity: Float = 0
    
    
    // MARK: - Initializators
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    
    override func layoutSubviews() {
        
        rainView?.bounds = frame
        stormView?.bounds = frame
        snowView?.bounds = frame
        
    }
    
    // MARK: - Setup Views
    
    func setupView() {
        
        sky1 = getSky()
        sky1.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(sky1)
        NSLayoutConstraint.activate([
            sky1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -100),
            sky1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 100),
            sky1.centerYAnchor.constraint(equalTo: topAnchor, constant: -100),
            sky1.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        bringSubviewToFront(sky1)
    }
    
    func setupRainView(){
        if let rainView = animate.rainView {
            rainView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(rainView)
            bringSubviewToFront(sky1)
            
            NSLayoutConstraint.activate([
                
                rainView.topAnchor.constraint(equalTo: topAnchor),
                rainView.leadingAnchor.constraint(equalTo: leadingAnchor),
                rainView.trailingAnchor.constraint(equalTo: trailingAnchor),
                rainView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
            ])
        }
    }
    
    func setupSnowView(){
        if let snowView {
            snowView.translatesAutoresizingMaskIntoConstraints = false
            
            
            addSubview(snowView)
            bringSubviewToFront(sky1)
            
            NSLayoutConstraint.activate([
                
                snowView.topAnchor.constraint(equalTo: topAnchor),
                snowView.leadingAnchor.constraint(equalTo: leadingAnchor),
                snowView.trailingAnchor.constraint(equalTo: trailingAnchor),
                snowView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
            ])
        }
    }
    
    func setupStormView(){
        if let stormView {
            stormView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(stormView)
            bringSubviewToFront(sky1)
            
            NSLayoutConstraint.activate([
                stormView.topAnchor.constraint(equalTo: topAnchor),
                stormView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stormView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stormView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        }
    }
    
}

    // MARK: - Animations
//
//extension CloudView {
//    func setRain(){
//    
//        animate.rainStart()
//        rainView = animate.rainView
//        
//        if let rainView {
//            
//            rainView.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(rainView)
//            bringSubviewToFront(sky1)
//            
//            NSLayoutConstraint.activate([
//                
//                rainView.topAnchor.constraint(equalTo: topAnchor),
//                rainView.leadingAnchor.constraint(equalTo: leadingAnchor),
//                rainView.trailingAnchor.constraint(equalTo: trailingAnchor),
//                rainView.bottomAnchor.constraint(equalTo: bottomAnchor),
//                
//            ])
//        }
//    }
//    
//    
//    func setSnow(){
//        
//        animate.snowStart()
//        snowView = animate.snowView
//        
//        if let snowView {
//            snowView.translatesAutoresizingMaskIntoConstraints = false
//            
//            
//            addSubview(snowView)
//            bringSubviewToFront(sky1)
//            
//            NSLayoutConstraint.activate([
//                
//                snowView.topAnchor.constraint(equalTo: topAnchor),
//                snowView.leadingAnchor.constraint(equalTo: leadingAnchor),
//                snowView.trailingAnchor.constraint(equalTo: trailingAnchor),
//                snowView.bottomAnchor.constraint(equalTo: bottomAnchor),
//                
//            ])
//            
//        }
//    }
//    
//    func setStorm(){
//        
//        animate.thunderStart()
//        stormView = animate.stormView
//        
//        if let stormView {
//        stormView.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(stormView)
//            bringSubviewToFront(sky1)
//            
//            NSLayoutConstraint.activate([
//                stormView.topAnchor.constraint(equalTo: topAnchor),
//                stormView.leadingAnchor.constraint(equalTo: leadingAnchor),
//                stormView.trailingAnchor.constraint(equalTo: trailingAnchor),
//                stormView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            ])
//        }
//    }
//    
//    func setRainAndStorm(){
//        
//        animate.setRainAndStorm()
//        stormView = animate.stormView
//        rainView = animate.rainView
//        
//        if let stormView {
//        stormView.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(stormView)
//            bringSubviewToFront(sky1)
//            
//            NSLayoutConstraint.activate([
//                stormView.topAnchor.constraint(equalTo: topAnchor),
//                stormView.leadingAnchor.constraint(equalTo: leadingAnchor),
//                stormView.trailingAnchor.constraint(equalTo: trailingAnchor),
//                stormView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            ])
//        }
//        
//        if let rainView {
//            
//            rainView.translatesAutoresizingMaskIntoConstraints = false
//            addSubview(rainView)
//            bringSubviewToFront(sky1)
//            
//            NSLayoutConstraint.activate([
//                
//                rainView.topAnchor.constraint(equalTo: topAnchor),
//                rainView.leadingAnchor.constraint(equalTo: leadingAnchor),
//                rainView.trailingAnchor.constraint(equalTo: trailingAnchor),
//                rainView.bottomAnchor.constraint(equalTo: bottomAnchor),
//                
//            ])
//        }
//    }
//    
//    
//    func animateCloudsIn(){
//        
//        stopAnimation()
//        
//        let animation = CABasicAnimation(keyPath: "position.y")
//        animation.fromValue = self.currentPosition
//        animation.toValue = -300 / 4
//        animation.duration = 3
//        animation.isRemovedOnCompletion = false
//        animation.fillMode = .forwards
//        animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
//        
//        let animationAlpha = CABasicAnimation(keyPath: "opacity")
//        animationAlpha.fromValue = currentOpacity
//        animationAlpha.toValue = 1
//        animationAlpha.duration = 3
//        animationAlpha.isRemovedOnCompletion = false
//        animationAlpha.fillMode = .forwards
//        animationAlpha.timingFunction = CAMediaTimingFunction(name: .easeIn)
//        
//        
//        sky1.layer.add(animationAlpha, forKey: "moveSkyOutAlpha")
//        sky1.layer.add(animation, forKey: "moveSkyOut")
//        
//        animationAlpha.delegate = self
//        animation.delegate = self
//    }
//    
//    func animateCloudsOut(){
//        stopAnimation()
//        
//        let animation = CABasicAnimation(keyPath: "position.y")
//        animation.fromValue = self.currentPosition
//        animation.toValue = -sky1.bounds.size.height
//        animation.duration = 5
//        animation.isRemovedOnCompletion = false
//        animation.fillMode = .forwards
//        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
//        
//        
//        let animationAlpha = CABasicAnimation(keyPath: "opacity")
//        animationAlpha.fromValue = self.currentOpacity
//        animationAlpha.toValue = 0
//        animationAlpha.duration = 3
//        animationAlpha.isRemovedOnCompletion = false
//        animationAlpha.fillMode = .forwards
//        animationAlpha.timingFunction = CAMediaTimingFunction(name: .easeIn)
//
//        sky1.layer.add(animationAlpha, forKey: "moveSkyOutAlpha")
//        sky1.layer.add(animation, forKey: "moveSkyOut")
//        
//        animationAlpha.delegate = self
//        animation.delegate = self
//
//    }
//    
//    func makeClear(){
//        animate.stopAllAnimations()
//        animateCloudsOut()
//    }
//    
//    func stopAnimation() {
//
//            currentPosition = sky1.layer.presentation()?.position.y ?? 0.0
//            currentOpacity = sky1.layer.presentation()?.opacity ?? 0.0
//            
//            sky1.layer.position.y = currentPosition
//            sky1.layer.opacity = currentOpacity
//            
//            
//            sky1.layer.setValue(currentPosition, forKeyPath: "position.y")
//            sky1.layer.setValue(currentOpacity, forKeyPath: "opacity")
//            
//            sky1.layer.removeAnimation(forKey: "moveSkyIn")
//            sky1.layer.removeAnimation(forKey: "moveSkyInAlpha")
//            sky1.layer.removeAnimation(forKey: "moveSkyOut")
//            sky1.layer.removeAnimation(forKey: "moveSkyOutAlpha")
//        
//    }
//}

    
extension CloudView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {

        
        if let animation = anim as? CABasicAnimation, animation.keyPath == "position.y" {
            self.currentPosition = animation.toValue as? CGFloat ?? 0.0
        }
        
        if let animation = anim as? CABasicAnimation, animation.keyPath == "opacity" {
            self.currentOpacity = animation.toValue as? Float ?? 0.0
        }
    }
}

