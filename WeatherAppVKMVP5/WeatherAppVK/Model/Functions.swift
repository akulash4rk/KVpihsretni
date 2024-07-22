//
//  CloudImage.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 18.07.2024.
//

import Foundation
import UIKit


//Вью для неба
func getSky() -> UIView {
    
    let mainView = UIView()
    let width = Int(UIScreen.main.bounds.width)
    let const: Int = width / 10
    let layerSpeeds: [CGFloat] = [0.5, 1.0, 3] 

        for layerIndex in (1...2).reversed() {
            for _ in 0...const {
                let currentImageView = UIImageView()
                currentImageView.image = UIImage(named: "sky")
                
                let currentWidth = currentImageView.image!.size.width
                let currentHeight = currentImageView.image!.size.height
                
                
                let multi = CGFloat.random(in: 0.25...0.3)
                var x = CGFloat.random(in: -currentWidth...UIScreen.main.bounds.width+currentWidth)
                
                let minsY : CGFloat = CGFloat(20 * 1/layerIndex)
                let maxY : CGFloat = CGFloat(40 * 1/layerIndex)
                let y = CGFloat.random(in: minsY...maxY)
                
                currentImageView.frame = CGRect(x: x, y: y, width: currentWidth * multi * (CGFloat(layerIndex) + 1) / 2, height: currentHeight * multi * (CGFloat(layerIndex) + 1) / 2)
                
                let initialAngle: CGFloat = .pi / CGFloat.random(in: 60...70)
                
                
                currentImageView.transform = CGAffineTransform(rotationAngle: initialAngle)
                let mins = CGFloat(layerIndex * 100)
                let maxi = CGFloat(layerIndex * 150)
                let randomDuration = CGFloat.random(in: mins...maxi) * layerSpeeds[layerIndex]
                
                
                mainView.addSubview(currentImageView)
                animate()
                func animate() {
                    UIView.animate(withDuration: CFTimeInterval(randomDuration), delay: 0, options: [.curveLinear], animations: {
                        currentImageView.frame.origin.x = UIScreen.main.bounds.width + currentWidth
                    }, completion: { _ in
                        x = -currentWidth * CGFloat(const)
                        currentImageView.frame.origin.x =  -currentWidth
                        animate()
                    })
                }
            }
        }


    
    return mainView
}


//Вью для тумана
func getFog() -> UIView {
    
    let mainView = UIView()
    let width = Int(UIScreen.main.bounds.width)
    let const: Int = width / 10

    for layerIndex in (0...1) {
            for _ in 0...const {
                let currentImageView = UIImageView()
                currentImageView.image = UIImage(named: "sky")
                
                mainView.addSubview(currentImageView)
                
                let currentWidth = currentImageView.image!.size.width
                let currentHeight = currentImageView.image!.size.height
                
                
                let multi = CGFloat.random(in: 1...2)
                var x = CGFloat.random(in: -currentWidth...UIScreen.main.bounds.width+currentWidth)
                
                let y = CGFloat.random(in: 0...UIScreen.main.bounds.height)
                
                currentImageView.frame = CGRect(x: x, y: y, width: currentWidth * multi * (CGFloat(layerIndex) + 1) / 2, height: currentHeight * multi * (CGFloat(layerIndex) + 1) / 2)
                currentImageView.alpha = 0.3
                
                let mins = CGFloat((layerIndex + 1) * 10 )
                let maxi = CGFloat((layerIndex + 1) * 20 )
                
                let randomDuration = CGFloat.random(in: mins...maxi) * 1
                
                
                mainView.addSubview(currentImageView)
                
                animate()
                func animate() {
                    UIView.animate(withDuration: CFTimeInterval(randomDuration), delay: 0, options: [.curveLinear], animations: {
                        currentImageView.frame.origin.x = UIScreen.main.bounds.width + currentWidth
                    }, completion: { _ in
                        x = -currentWidth * CGFloat(const)
                        currentImageView.frame.origin.x =  -currentWidth
                        animate()
                    })
                }
            }
        }


    
    return mainView
}
