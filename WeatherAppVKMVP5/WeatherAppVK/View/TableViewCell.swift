//
//  TableViewCell.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 17.07.2024.
//

import Foundation
import UIKit
class MyCustomCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    lazy var animations = CollectionViewCellAnimation()
    
    private let label : UILabel = {
        
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    // MARK: - Initializators
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        setAnimations()
        setupUI()

    }
    
    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setAnimations()
        setupUI()

    }

    // MARK: Setup views & layers
    
    private func setAnimations(){
        
        animations.setupRainLayers()
        animations.setupSnowLayers()
        
        let freezeImageView = animations.freezeImageView
        let fogUpImageView = animations.fogUpImageView
        
        addSubview(freezeImageView)
        addSubview(fogUpImageView)

        fogUpImageView.layer.cornerRadius = 16
        fogUpImageView.clipsToBounds = true
        
        fogUpImageView.sizeToFit()
        freezeImageView.sizeToFit()

        freezeImageView.layer.cornerRadius = 16
        freezeImageView.clipsToBounds = true
        
        freezeImageView.translatesAutoresizingMaskIntoConstraints = false
        fogUpImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fogUpImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fogUpImageView.topAnchor.constraint(equalTo: topAnchor),
            fogUpImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fogUpImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            freezeImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            freezeImageView.topAnchor.constraint(equalTo: topAnchor),
            freezeImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            freezeImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        let snowEmmiter = animations.snowEmitterLayer
        layer.addSublayer(snowEmmiter)

        snowEmmiter.frame = bounds
        snowEmmiter.cornerRadius = 16
        snowEmmiter.masksToBounds = true
        
        snowEmmiter.emitterSize = CGSize(width: frame.size.width, height: frame.size.height)
        snowEmmiter.emitterPosition = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
    }
    
    private func setupUI() {
        
        addSubview(label)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        layer.cornerRadius = 16
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }
    
    // MARK: - Configure
    
    func configureCell(currentName:  String){
        label.text = currentName
    }
    
}

