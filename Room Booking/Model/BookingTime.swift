//
//  BookingTime.swift
//  Room Booking
//
//  Created by Reagan Brasch on 19/5/2022.
//

import Foundation
class BookingTime {
    var startHours: Int = 0;
    var startMinutes: Int = 0;
    var endHours: Int = 0;
    var endMinutes: Int = 0;
    
    init(_ sh: Int, _ sm: Int, _ eh: Int, _ em: Int) {
        startHours = sh
        startMinutes = sm
        endHours = eh
        endMinutes = em
    }
}
