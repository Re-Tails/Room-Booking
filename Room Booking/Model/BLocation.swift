//
//  BookingRoom.swift
//  Room Booking
//
//  Created by Reagan Brasch on 20/5/2022.
//

import Foundation
class BLocation: CustomStringConvertible {
    
    var building: String = ""
    var level: String = ""
    var room: String = ""
    
    public var description: String { return "\(building)_\(level)_\(room)" }
    
    init(_ location: String) {
        let locationArray: [String] = location.components(separatedBy: "_")
        building = locationArray[0]
        level = locationArray[1]
        room = locationArray[2]
    }
}
