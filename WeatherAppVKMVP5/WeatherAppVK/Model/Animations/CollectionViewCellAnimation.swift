//
//  CollectionViewCellAnimation.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 21.07.2024.
//

import Foundation
import UIKit


class CollectionViewCellAnimation {
    
    // MARK: - Properties
    
    var snowEmitterLayer = CAEmitterLayer()
    private let snowflake = CAEmitterCell()
    
    var freezeImageView = UIImageView()
    var fogUpImageView = UIImageView()
    
    private var currentBirthRate : Float = 0
    private var snowTimer : Timer?
    
    var isAnimationRunning = false
    
    // MARK: - Setup layers
    
    func setupRainLayers() {
        fogUpImageView = UIImageView(image: UIImage(named: "fogup"))
        fogUpImageView.alpha = 0
    }
    
    func setupSnowLayers(){
        freezeImageView = UIImageView(image: UIImage(named: "freeze"))
        freezeImageView.alpha = 0
        
        
        snowEmitterLayer = CAEmitterLayer()
        
        snowEmitterLayer.emitterShape = .rectangle
        snowEmitterLayer.birthRate = 0
        
        snowflake.contents = UIImage(named: "snowflake")?.cgImage
        snowflake.birthRate = 1
        snowflake.lifetime = 15
        snowflake.emissionLongitude = .pi
        snowflake.emissionRange = .pi / 4
        snowflake.scale = 0.1
        snowflake.scaleRange = 0.1
        snowflake.alphaSpeed = 0.4
        
        snowEmitterLayer.emitterCells = [snowflake]
        
    }
}

// MARK: - Animations

extension CollectionViewCellAnimation {
    
    func freezeAnimationIn(){

        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {
            self.freezeImageView.alpha = 0.25
        })
        
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {
            self.snowEmitterLayer.opacity = 1.0
        })
    }
    
    func freezeAnimationOut(){
        
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {
            self.freezeImageView.alpha = 0.0
        })
        
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {
            self.snowEmitterLayer.opacity = 0.0
        })
        
    }
    
    func snowAnimationIn(){
        snowTimer?.invalidate()
        
        self.freezeAnimationIn()
        
        animateSnow(to: 3, duration: 3)
    }
    
    func snowAnimationOut(){
        snowTimer?.invalidate()
        self.freezeAnimationOut()
        animateSnow(to: 0, duration: 3)
    }
    
    func rainAnimationIn(){
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {
            self.fogUpImageView.alpha = 0.4
        })
    }
    
    func rainAnimationOut(){
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut, .beginFromCurrentState], animations: {
            self.fogUpImageView.alpha = 0.0
        })
    }
    
    
    func animateSnow(to newBirthRate: Float, duration: TimeInterval) {
        
        if newBirthRate == 0 {
            snowEmitterLayer.emitterCells?.first?.lifetime = 5

        } else {
            snowEmitterLayer.emitterCells?.first?.lifetime = 15
        }
        
        let step = (newBirthRate - currentBirthRate) / Float(duration * 60)
        snowTimer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { [weak self] timer in
            
            guard let self = self else { return }
            
            self.currentBirthRate += step
            self.snowEmitterLayer.birthRate = self.currentBirthRate
            if abs(self.currentBirthRate - newBirthRate) < abs(step) {
                self.snowEmitterLayer.emitterCells?.first?.birthRate = newBirthRate
                timer.invalidate()
            }
        }
    }
}
