//
//  DatabaseManager.swift
//  myProgress
//
//  Created by Lucian Cerbu on 06.03.2022.
//

import Foundation
import FirebaseFirestore

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private init() {}
    
    let database = Firestore.firestore()
}
