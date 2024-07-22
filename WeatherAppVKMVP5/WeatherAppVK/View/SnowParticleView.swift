//
//  SnowParticleView.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 17.07.2024.
//

import Foundation
import UIKit

class SnowView: UIView {
    
    // MARK: - Properties
    
    var currentBirthRate : Float = 0
    private var rainTimer: Timer?
    
    private var particleEmitter = CAEmitterLayer()
    private let snowFlakeCell = CAEmitterCell()
    
    var remove : (() -> Void?)?
    // MARK: - Initializators
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEmitter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    deinit {
    }
    
    //MARK: - Emmiter
    
    func setupEmitter() {
        
        particleEmitter.setupEmitter()
        
        snowFlakeCell.setSnow()
        particleEmitter.emitterCells = [snowFlakeCell]
        
        layer.addSublayer(particleEmitter)
    }
    
}

extension SnowView {
    
    func startSnow() {
        rainTimer?.invalidate()
        
        let to: Float = Float(UIScreen.main.bounds.width / 4)
        let duration = Int(max(1, abs(to - currentBirthRate) / 200))
        
        animateSnow(to: to, duration: TimeInterval(duration))
    }
    
    func stopSnow() {
        
        rainTimer?.invalidate()
        
        let to: Float = 0
        let duration = Int(max(1, abs(to - currentBirthRate) / 200 ))
        
        animateSnow(to: to, duration: TimeInterval(duration))
        
    }
    
    func animateSnow(to newBirthRate: Float, duration: TimeInterval) {
        
        let step = (newBirthRate - currentBirthRate) / Float(duration * 60)
        rainTimer = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            
            self.currentBirthRate += step
            self.particleEmitter.birthRate = self.currentBirthRate
            if abs(self.currentBirthRate - newBirthRate) < abs(step) {
                self.currentBirthRate = newBirthRate
                self.particleEmitter.birthRate = newBirthRate
                
                if self.particleEmitter.birthRate == 0 && newBirthRate == 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                        if self.particleEmitter.birthRate == 0  && newBirthRate == 0{
                            self.removeFromSuperview()
                            self.remove?()
                        }
                    }
                }
                
                timer.invalidate()
            }
        }
    }
}
