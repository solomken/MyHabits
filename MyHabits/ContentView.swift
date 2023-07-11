//
//  ContentView.swift
//  MyHabits
//
//  Created by Anastasiia Solomka on 06.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = Activities() //watch any change of object. if one of Published properties changes = view reloads
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List (data.activities) { activity in
                NavigationLink {
                    ActivityView(data: data, activity: activity)
                } label: {
                    HStack {
                        Text(activity.title)
                        
                        Spacer()
                        
                        Text(String(activity.completionCount))
                            .font(.caption.weight(.black))
                            .padding(5)
                            .frame(maxWidth: 50)
                            .background(color(for: activity))
                            .clipShape(Capsule())
                    }
                }
            }
            .navigationTitle("MyHabits")
            .toolbar {
                Button {
                    showingAddHabit.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddActivity(data: data)
            }
        }
    }
    
    func color(for item: Activity) -> Color {
        if item.completionCount < 3 {
            return .red
        } else if item.completionCount < 10 {
            return .orange
        } else if item.completionCount < 20 {
            return .green
        } else if item.completionCount < 50 {
            return .blue
        } else {
            return .indigo
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
