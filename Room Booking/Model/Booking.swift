//
//  Booking.swift
//  Room Booking
//
//  Created by Reagan Brasch on 19/5/2022.
//

import Foundation

// example:
//    let booking: Booking = Booking("6.5.101", "10:00", "11:30")

class Booking: CustomStringConvertible {
    
    var location: BLocation
    var startTime: BTime
    var endTime: BTime
    
    public var description: String { return "\(location) \(startTime) \(endTime)" }
    
    init(_ location: String, _ startTime: String, _ endTime: String) {
        self.location = BLocation(location)
        self.startTime = BTime(startTime)
        self.endTime = BTime(endTime)
    }
    
    init(_ location: BLocation, _ startTime: BTime, _ endTime: BTime) {
        self.location = location
        self.startTime = startTime
        self.endTime = endTime
    }
}
