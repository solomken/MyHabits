//
//  Activities.swift
//  MyHabits
//
//  Created by Anastasiia Solomka on 06.07.2023.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities: [Activity] { //class to store all items
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                activities = decodedItems
                return
            }
        }
        
        activities = []
    }
}
