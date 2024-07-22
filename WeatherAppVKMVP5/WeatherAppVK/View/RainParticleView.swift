//
//  RainParticleView.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 17.07.2024.
//

import Foundation
import UIKit
class RainParticleView: UIView {
    
    // MARK: - Properties
    
    private var currentBirthRate : Float = 0
    private var rainTimer: Timer?
    private let particleEmitter = CAEmitterLayer()
    
    var remove : (() -> Void?)?
    
    // MARK: - Initializators
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupParticleEmitter()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupParticleEmitter()
    }
    
    deinit {

    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        
        particleEmitter.emitterPosition = CGPoint(x: bounds.width / 2, y: -10)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: bounds.width, height: 1)
        
    }
    
    // MARK: - Emitter
    
    private func setupParticleEmitter() {
        particleEmitter.setupEmitter()
        
        let rainDrop = CAEmitterCell()
        rainDrop.setRain()
        
        particleEmitter.emitterCells = [rainDrop]
        
        
        self.particleEmitter.birthRate = currentBirthRate
        
        
        layer.addSublayer(particleEmitter)
        
    }
}

    // MARK: - Animations

extension RainParticleView {
    
    func startRain() {
        
        
        let to: Float = Float(UIScreen.main.bounds.width)
        
        if to != self.particleEmitter.birthRate {
            
            rainTimer?.invalidate()
            
            let duration = Int(max(1, abs(to - currentBirthRate) / 100))
            
            animateRain(to: to, duration: TimeInterval(duration))
        }
    }
    
    func stopRain() {
        
        let to: Float = 0

        if to != self.particleEmitter.birthRate {
            rainTimer?.invalidate()
            let duration = Int(max(1, abs(to - currentBirthRate) / 100))
            
            animateRain(to: to, duration: TimeInterval(duration))
        }
    }
    
    
    func animateRain(to newBirthRate: Float, duration: TimeInterval) {
        
        let step = (newBirthRate - currentBirthRate) / Float(duration * 60)
        
        rainTimer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { [weak self] timer in
            
            guard let self = self else { return }
            
            self.currentBirthRate += step
            self.particleEmitter.birthRate = self.currentBirthRate
            if abs(self.currentBirthRate - newBirthRate) < abs(step) || self.currentBirthRate < 0 || self.currentBirthRate > Float(UIScreen.main.bounds.width)  {
                self.currentBirthRate = newBirthRate
                if self.currentBirthRate == 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        if self.currentBirthRate == 0 {
                            self.remove?()
                            self.removeFromSuperview()
                        }
                    }
                }
                timer.invalidate()
            }
        }
    }
}

