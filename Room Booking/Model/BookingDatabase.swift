//
//  Database.swift
//  Room Booking
//
//  Created by Reagan Brasch on 19/5/2022.
//

import FirebaseDatabase
import Foundation

class BookingDatabase {
    private let database = Database.database().reference()
    
    var b6: [Int] = []
    var b2: [Int] = []
    var b11: [Int] = []
    
    var bookings: [Booking] = []
    
    func addBooking(building: String, level: String, room: String, start_time: BookingTime, end_time: BookingTime) {
        let object: [String: Any] = [
            "name": "rob bob" as NSObject,
            "dog": "cody"
        ]
        
        database.child("something_22").setValue(object)
    }
    
    func getBooking() {
        database.child("something_22").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                print("and you failed")
                return
            }
            
            print("Value \(value)")
        })
    }
}
