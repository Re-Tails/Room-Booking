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
    
    var b6: [String] = ["06_06_113", "06_04_100", "06_05_112"]
    var b2: [String] = ["02_06_167", "02_05_102", "02_07_118"]
    var b11: [String] = ["11_05_300", "11_04_200", "11_06_101"]
    
    var times: [String] = []
    var addedTimes: [String] = []
    var room: BLocation
    
    init(room: BLocation) {
        self.room = room
    }
        
    func addBooking(_ date: BDate, _ startTime: BTime, _ endTime: BTime) {
        let str: String = "\(date) \(startTime) \(endTime)"
        print("adding \(str)")
        addedTimes.append(str)
    }
    
    func submitBooking() {
        fetchTimes(location: room, completionHandler: {
            var newTimes = self.addedTimes
            newTimes = Array(Set(newTimes))
            print("newTimes \(newTimes)")
            self.database.child(self.room.description).setValue(newTimes)
        })
    }
    
    func fetchTimes(location: BLocation, completionHandler: @escaping (() -> ())) {
        self.ref.child(location.description).observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.exists(){
                if let value = snapshot.value as? [String] {
                    self.times = value
                }
   
                completionHandler()
            } else {
                print("No times found for location \(location.description)")
                completionHandler()
            }
        }
    }
    
    func deleteBooking(time: BTime) {
        if let index = addedTimes.firstIndex(of: time.description) {
            addedTimes.remove(at: index)
        }
    }
}
