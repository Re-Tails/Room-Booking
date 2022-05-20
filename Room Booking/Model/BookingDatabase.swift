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
    
    var ref: DatabaseReference! = Database.database().reference()
    var databaseHandle: DatabaseHandle?
    
    var b6: [String] =  ["06_06_113"]
    var b2: [String] =  ["02_06_167"]
    var b11: [String] = ["11_05_300"]
    
    var testiboi: Any = []
        
    func addBooking(booking: Booking) {
        // key is 06.06.113
        // value is [(10:00 -> 10:30), (10:30 -> 11:00)]
        
        let object: [String: Any] = [
            "times": ["10_00", "10_30", "10_30", "11_00"]
        ]
        
        database.child("06_06_113").setValue(object)
    }
    
    func someFuck(values: [String]) {
        testiboi = values
    }
    
    func getBooking(booking: Booking) {
        print("searching for \(booking.location.description)")
        database.child(booking.location.description).observeSingleEvent(of: .value, with: { snapshot in
            if let value = snapshot.value as? [String: [String]] {
                self.testiboi = value["times"]!
            }
            
            //print("Value \(value)")
        })
    }
    
    func deleteBooking(booking: Booking) {
        database.child(booking.location.description).removeValue()
    }
}
