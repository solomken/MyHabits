//
//  Activity.swift
//  MyHabits
//
//  Created by Anastasiia Solomka on 06.07.2023.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable { //represents single item of habit,  Identifiable - means that type can be Identifiable uniqly. it must contain id property that should has unique identifier
    var id = UUID() //id that Swift will create for us automatically each time
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = Activity(title: "Example habit", description: "This is example habit.")
}
