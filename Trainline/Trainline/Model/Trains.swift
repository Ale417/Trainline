//
//  Trains.swift
//  Trainline
//
//  Created by Alessia Previdente on 22/11/23.
//

import Foundation

struct Train: Identifiable {
    var id: UUID = UUID()
    var Departure: String
    var DepartureCity: String
    var TimeDeparture: String
    var Arrival: String
    var ArrivalCity: String
    var TimeArrival: String
    var Country: String
    var Prices: Int
    var Durata: String
}


