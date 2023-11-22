//
//  TrainlineApp.swift
//  Trainline
//
//  Created by Alessia Previdente on 15/11/23.
//

import SwiftUI
import SwiftData

@main
struct TrainlineApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TrainData.self)
    }
}
