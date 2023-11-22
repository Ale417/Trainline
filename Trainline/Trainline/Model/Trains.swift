//
//  Trains.swift
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

struct Train: Identifiable {
    var id: UUID = UUID()
    var Departure: String
    var DepartureCity: String
    var Arrival: String
    var ArrivalCity: String
    var Country: String
    var Prices: Int
}


