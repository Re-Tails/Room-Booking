//
//  BookingTime.swift
//  Room Booking
//
//  Created by Reagan Brasch on 19/5/2022.
//

import Foundation
class BookingTime: CustomStringConvertible {
    var hours: String = "";
    var minutes: String = "";
    
    public var description: String { return "\(hours):\(minutes)" }
    
    init(_ time: String) {
        let timeArray = time.components(separatedBy: ":")
        hours = timeArray[0]
        minutes = timeArray[1]
    }
}
