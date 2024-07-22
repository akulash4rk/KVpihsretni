//
//  SunCloudFogAnimations.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 22.07.2024.
//

import Foundation
import UIKit

class SunCloudFogAnimations {
    
    // MARK: - Properties
    
    var sunView : SunsetSunriseView? = nil
    var fogView : FogView? = nil
    var cloudView : CloudView? = nil
    
    // MARK: - Initializators
    
    init() {
        self.sunView = SunsetSunriseView()
        self.fogView = FogView()
        self.cloudView = CloudView()
    }
    
    // MARK: - Animations
    
    func sunAnimationIn() {
        stopSunAnimation()
        
        if let sunView {
            
            let sunAnimationY = CAKeyframeAnimation(keyPath: "position.y")
            sunAnimationY.values = [sunView.currentPositionY, -50]
            
            let sunAnimationX = CAKeyframeAnimation(keyPath: "position.x")
            sunAnimationX.values = [sunView.currentPositionX, sunView.bounds.width + 50]
            
            sunAnimationY.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            sunAnimationX.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            let mainAnimationGroup = CAAnimationGroup()
            mainAnimationGroup.animations = [sunAnimationY, sunAnimationX]
            mainAnimationGroup.duration = 5
            mainAnimationGroup.fillMode = .forwards
            mainAnimationGroup.isRemovedOnCompletion = false
            sunView.sunImageView.layer.add(mainAnimationGroup, forKey: "mainAnimations")
            
        }
    }
    
    
    func sunAnimationOut() {
        
        stopSunAnimation()
        
        if let sunView {
            
            let sunAnimationY = CAKeyframeAnimation(keyPath: "position.y")
            sunAnimationY.values = [sunView.currentPositionY, sunView.bounds.height + 500]
            
            let sunAnimationX = CAKeyframeAnimation(keyPath: "position.x")
            sunAnimationX.values = [sunView.currentPositionX, sunView.bounds.width + 1000]
            
            sunAnimationY.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            sunAnimationX.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            let mainAnimationGroup = CAAnimationGroup()
            mainAnimationGroup.animations = [sunAnimationY, sunAnimationX]
            mainAnimationGroup.duration = 5
            mainAnimationGroup.fillMode = .forwards
            mainAnimationGroup.isRemovedOnCompletion = false
            
            sunView.sunImageView.layer.add(mainAnimationGroup, forKey: "mainAnimations")
        }
    }
    
    
    func stopSunAnimation() {
        if let sunView {
            
            sunView.currentPositionX = sunView.sunImageView.layer.presentation()?.position.x ?? 0.0
            sunView.currentPositionY = sunView.sunImageView.layer.presentation()?.position.y ?? 0.0
            
            
            
            sunView.sunImageView.layer.position.y = sunView.currentPositionY
            sunView.sunImageView.layer.position.x = sunView.currentPositionX
            
            
            sunView.sunImageView.layer.setValue(sunView.currentPositionY, forKeyPath: "position.y")
            sunView.sunImageView.layer.setValue(sunView.currentPositionX, forKeyPath: "position.x")
            
            sunView.sunImageView.layer.removeAnimation(forKey: "mainAnimations")
            
        }
    }
    
    func fogAnimationIn(){
        stopFogAnimation()
        
        print("Извиняюсь за кривую анимацию, немного не успевал :(")
        
        if let fogView {
            
            let animationAlpha = CABasicAnimation(keyPath: "opacity")
            animationAlpha.fromValue = fogView.currentOpacity
            animationAlpha.toValue = 1
            animationAlpha.duration = 1
            animationAlpha.isRemovedOnCompletion = false
            animationAlpha.fillMode = .forwards
            animationAlpha.timingFunction = CAMediaTimingFunction(name: .easeIn)
            fogView.fogView.layer.add(animationAlpha, forKey: "moveFogIn")
            
            animationAlpha.delegate = fogView
        }
    }
    
    func fogAnimationOut(){
        stopFogAnimation()
        
        if let fogView {
            let animationAlpha = CABasicAnimation(keyPath: "opacity")
            animationAlpha.fromValue = fogView.currentOpacity
            animationAlpha.toValue = 0
            animationAlpha.duration = 1
            animationAlpha.isRemovedOnCompletion = false
            animationAlpha.fillMode = .forwards
            
            animationAlpha.timingFunction = CAMediaTimingFunction(name: .easeIn)
            
            fogView.fogView.layer.add(animationAlpha, forKey: "moveFogOut")
            
            animationAlpha.delegate = fogView
        }
    }
    
    
    func stopFogAnimation() {
        
        if let fogView {
            fogView.currentOpacity = fogView.fogView.layer.presentation()?.opacity ?? 0.0
            
            fogView.fogView.layer.opacity = fogView.currentOpacity
            
            fogView.fogView.layer.setValue(fogView.currentOpacity, forKeyPath: "opacity")
            
            fogView.fogView.layer.removeAnimation(forKey: "moveFogIn")
            fogView.fogView.layer.removeAnimation(forKey: "moveFogOut")
            
        }
    }
    
    
    func setRain(){
        
        if let cloudView {
            cloudView.animate.rainStart()
            cloudView.rainView = cloudView.animate.rainView
            cloudView.setupRainView()
        }
        
    }
    
    
    func setSnow(){
        if let cloudView {
            cloudView.animate.snowStart()
            cloudView.snowView = cloudView.animate.snowView
            cloudView.setupSnowView()
        }
    }
    
    func setStorm(){
        if let cloudView {
            cloudView.animate.thunderStart()
            cloudView.stormView = cloudView.animate.stormView
            cloudView.setupStormView()
        }
    }
    
    func setRainAndStorm(){
        if let cloudView {
            cloudView.animate.setRainAndStorm()
            cloudView.stormView = cloudView.animate.stormView
            cloudView.rainView = cloudView.animate.rainView
            
            cloudView.setupStormView()
            cloudView.setupRainView()
        }
    }
    
    
    func animateCloudsIn(){
        
        if let cloudView {
            stopAnimation()
            
            let animation = CABasicAnimation(keyPath: "position.y")
            animation.fromValue = cloudView.currentPosition
            animation.toValue = -300 / 4
            animation.duration = 3
            animation.isRemovedOnCompletion = false
            animation.fillMode = .forwards
            animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
            
            let animationAlpha = CABasicAnimation(keyPath: "opacity")
            animationAlpha.fromValue = cloudView.currentOpacity
            animationAlpha.toValue = 1
            animationAlpha.duration = 3
            animationAlpha.isRemovedOnCompletion = false
            animationAlpha.fillMode = .forwards
            animationAlpha.timingFunction = CAMediaTimingFunction(name: .easeIn)
            
            
            cloudView.sky1.layer.add(animationAlpha, forKey: "moveSkyOutAlpha")
            cloudView.sky1.layer.add(animation, forKey: "moveSkyOut")
            
            animationAlpha.delegate = cloudView
            animation.delegate = cloudView
        }
    }
    
    func animateCloudsOut(){
        stopAnimation()
        if let cloudView {
            let animation = CABasicAnimation(keyPath: "position.y")
            animation.fromValue = cloudView.currentPosition
            animation.toValue = -cloudView.sky1.bounds.size.height
            animation.duration = 5
            animation.isRemovedOnCompletion = false
            animation.fillMode = .forwards
            animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
            
            
            let animationAlpha = CABasicAnimation(keyPath: "opacity")
            animationAlpha.fromValue = cloudView.currentOpacity
            animationAlpha.toValue = 0
            animationAlpha.duration = 3
            animationAlpha.isRemovedOnCompletion = false
            animationAlpha.fillMode = .forwards
            animationAlpha.timingFunction = CAMediaTimingFunction(name: .easeIn)
            
            cloudView.sky1.layer.add(animationAlpha, forKey: "moveSkyOutAlpha")
            cloudView.sky1.layer.add(animation, forKey: "moveSkyOut")
            
            animationAlpha.delegate = cloudView
            animation.delegate = cloudView
        }
    }
    
    func makeClear(){
        if let cloudView {
            cloudView.animate.stopAllAnimations()
            animateCloudsOut()
        }
    }
    
    func stopAnimation() {
        if let cloudView {
            cloudView.currentPosition = cloudView.sky1.layer.presentation()?.position.y ?? 0.0
            cloudView.currentOpacity = cloudView.sky1.layer.presentation()?.opacity ?? 0.0
            
            cloudView.sky1.layer.position.y = cloudView.currentPosition
            cloudView.sky1.layer.opacity = cloudView.currentOpacity
            
            
            cloudView.sky1.layer.setValue(cloudView.currentPosition, forKeyPath: "position.y")
            cloudView.sky1.layer.setValue(cloudView.currentOpacity, forKeyPath: "opacity")
            
            cloudView.sky1.layer.removeAnimation(forKey: "moveSkyIn")
            cloudView.sky1.layer.removeAnimation(forKey: "moveSkyInAlpha")
            cloudView.sky1.layer.removeAnimation(forKey: "moveSkyOut")
            cloudView.sky1.layer.removeAnimation(forKey: "moveSkyOutAlpha")
        }
    }
    
    
}
