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
            MainView(partenza: .constant("Departure Station"), arrivo: .constant("Arrival Station"))
        }.modelContainer(for: [TrainData.self, Info.self])
      
    }

}
