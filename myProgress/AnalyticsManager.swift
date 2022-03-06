//
//  AnalyticsManager.swift
//  myProgress
//
//  Created by Lucian Cerbu on 06.03.2022.
//

import Foundation
import FirebaseAnalytics

final class AnalyticsManager {
    static let shared = AnalyticsManager()
    
    private init() {}
    
    func logEvent() {
        Analytics.logEvent("", parameters: [:])
    }
}
