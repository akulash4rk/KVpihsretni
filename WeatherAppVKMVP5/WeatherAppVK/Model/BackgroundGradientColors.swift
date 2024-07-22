//
//  BackgroundGradientColors.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 21.07.2024.
//

import Foundation
import UIKit

struct BackgroundGradientColors {
    
    static let snowBackgroundColors = [UIColor.lightGray.cgColor, UIColor.gray.cgColor]
    
    static let rainBackgroundColors = [UIColor(red: 1/255, green: 34/255, blue: 67/255, alpha: 1).cgColor, UIColor(red: 0, green: 150/255, blue: 197/255, alpha: 1).cgColor]
    
    static let stormBackgroundColors = [UIColor(red: 33/255, green: 43/255, blue: 52/255, alpha: 1).cgColor, UIColor(red: 113/255, green: 117/255, blue: 116/255, alpha: 1).cgColor]
    
    static let sunBackgroundColors = [UIColor(red: 255/255, green: 195/255, blue: 1/255, alpha: 1).cgColor, UIColor(red: 232/255, green: 58/255, blue: 20/255, alpha: 1).cgColor]
    
    static let cloudsBackgroundColors = [UIColor(red: 1/255, green: 34/255, blue: 67/255, alpha: 1).cgColor, UIColor.lightGray.cgColor]
    
}
