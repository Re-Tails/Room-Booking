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
    
    var building: String = ""
    var level: String = ""
    var room: String = ""
    
    var startTime: BookingTime
    var endTime: BookingTime
    
    public var description: String { return "\(building).\(level).\(room) \(startTime) \(endTime)" }
    
    init(_ location: String, _ startTime: String, _ endTime: String) {
        let locationArray: [String] = location.components(separatedBy: ".")
        building = locationArray[0]
        level = locationArray[1]
        room = locationArray[2]
        
        self.startTime = BookingTime(startTime)
        self.endTime = BookingTime(endTime)
    }
}
