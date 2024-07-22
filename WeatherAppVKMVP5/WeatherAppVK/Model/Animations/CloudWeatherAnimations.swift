//
//  CloudWeatherAnimations.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 21.07.2024.
//

import Foundation
import UIKit

class CloudWeatherAnimations {
    
    // MARK: - Properties
    var rainView : RainParticleView? = nil
    var snowView : SnowView? = nil
    var stormView : ThunderstormView? = nil
    
}

    // MARK: - Animations
extension CloudWeatherAnimations {
    
    func thunderStart(){
        
        if let stormView {
            stormView.isAnimationRunning = true
        }
        else {
            stormView = ThunderstormView()
            stormView?.isAnimationRunning = true
        }
        
        stormView?.remove = {
            self.stormView = nil
        }
        
        rainView?.stopRain()
        snowView?.stopSnow()
        
    }
    
    func rainStart(){
        
        if let rainView {
            rainView.startRain()
        }
        else {
            rainView = RainParticleView()
            rainView!.startRain()
        }
        
        rainView?.remove = {
            self.rainView = nil
        }
        
        stormView?.stopAnimation()
        snowView?.stopSnow()
        
    }
    
    func snowStart(){
        if let snowView {
            snowView.startSnow()
        } else {
            snowView = SnowView()
            snowView?.startSnow()
        }
        
        stormView?.stopAnimation()
        rainView?.stopRain()
        
        snowView!.remove = {
            self.snowView = nil
        }
    }
    
    func setRainAndStorm(){
        if let rainView {
            rainView.startRain()
        }
        else {
            rainView = RainParticleView()
            rainView!.startRain()
        }
        
        rainView?.remove = {
            self.rainView = nil
        }
        
        if let stormView {
            stormView.isAnimationRunning = true
        } else {
            stormView = ThunderstormView()
            stormView?.isAnimationRunning = true
        }
        
        stormView!.remove = {
            self.stormView = nil
        }
        
        
        snowView?.stopSnow()
    }
    
    func stopAllAnimations(){
      
            stormView?.stopAnimation()
            snowView?.stopSnow()
            rainView?.stopRain()
        
    }
    
}
