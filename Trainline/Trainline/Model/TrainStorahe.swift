//
//  TrainStorahe.swift
//  Trainline
//
//  Created by Alessia Previdente on 22/11/23.
//

import Foundation
import SwiftData

@Model class TrainData{
    var Departure: String
    var Arrival: String
    
    init(Departure: String, Arrival: String) {
        self.Departure = Departure
        self.Arrival = Arrival
    }
}
