//
//  ActivityView.swift
//  MyHabits
//
//  Created by Anastasiia Solomka on 06.07.2023.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var data: Activities
    var activity: Activity

    @State private var completionCount = 0
    
    var body: some View {
            List {
                Section {
                    if activity.description.isEmpty == false {
                        Text(activity.description)
                            .font(.title)
                    }
                }
                
                Section {
                    Text("Completion count: \(activity.completionCount)")
                    
                    Button("Mark habit as done") {
                        var newHabit = activity
                        newHabit.completionCount += 1
                        
                        if let index = data.activities.firstIndex(of: activity) {
                            data.activities[index] = newHabit //override the item with the new habit
                        }
                    }
                }
            }
            .navigationTitle(activity.title)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(data: Activities(), activity: Activity.example)
    }
}
