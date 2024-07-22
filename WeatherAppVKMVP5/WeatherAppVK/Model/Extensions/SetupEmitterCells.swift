//
//  SetupEmitter.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 22.07.2024.
//

import Foundation
import UIKit


extension CAEmitterCell {

    func setRain(){
        birthRate = 1
        lifetime = 3
        velocity = 1500
        velocityRange = 300
        emissionLongitude = .pi
        
        contents = UIImage(named: "rain")?.cgImage
        scale = 0.1
        scaleRange = 0.05
    }
    
    func setSnow(){
        contents = UIImage(named: "snowflake")?.cgImage
        birthRate = 1
        lifetime = 5
        emissionRange = .pi
        velocity = 100
        scale = 0.2
        scaleRange = 0.05
        yAcceleration = 10
    }
}

extension CAEmitterLayer {
    
    func setupEmitter(){
        emitterPosition = CGPoint(x: UIScreen.main.bounds.width / 2, y: -2)
        emitterShape = .rectangle
        emitterSize = CGSize(width: UIScreen.main.bounds.width, height: 2)
        birthRate = 0
    }
    
}
