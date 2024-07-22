//
//  StingExtension.swift
//  WeatherAppVK
//
//  Created by Владислав Баранов on 22.07.2024.
//

import Foundation


extension String {
    var localized: String {
        NSLocalizedString(self,
                          comment: "ERROR: \(self) not be found"
        )
    }
}
