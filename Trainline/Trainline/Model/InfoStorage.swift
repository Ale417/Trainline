//
//  InfoStorage.swift
//  Trainline
//
//  Created by Alessia Previdente on 22/11/23.
//

import Foundation
import SwiftData

@Model class Info {
    var OrarioA: Date
    var OrarioB: Date
    
    init(OrarioA: Date, OrarioB: Date) {
        self.OrarioA = OrarioA
        self.OrarioB = OrarioB
    }
}
