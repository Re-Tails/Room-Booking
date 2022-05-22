//
//  BDate.swift
//  Room Booking
//
//  Created by Reagan Brasch on 22/5/2022.
//

import Foundation
class BDate: CustomStringConvertible {
    var day: String = ""
    var month: String = ""
    var year: String = ""
    
    public var description: String { return "\(year)/\(month)/\(day)" }
    
    init(_ time: String) {
        //2022_05_22
        //yyyy:mo:dd
        let timeArray = time.components(separatedBy: "/")
        year = timeArray[0]
        month = timeArray[1]
        day = timeArray[2]
    }
    
    init() {
        year = "\(Calendar.current.component(.year, from: Date()))"
        month = "\(Calendar.current.component(.month, from: Date()))"
        day = "\(Calendar.current.component(.day, from: Date()))"
    }
}
