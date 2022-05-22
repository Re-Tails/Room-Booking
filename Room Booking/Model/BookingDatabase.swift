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
    var availableRooms = [String]()
    
    init(room: BLocation) {
        self.room = room
    }
        
    func addBooking(date: String, startTime: String, endTime: String) {
        let key = self.database.child(self.room.description).childByAutoId()
        key.setValue(date + " " + startTime + " " + endTime)
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
    
    func fetchRooms(checkDate:String, checkStart:String, checkEnd:String) -> Array<String> {
        var availableRooms = [String]()
        self.database.observeSingleEvent(of: .value, with: {snapshot in
            for currentRoom in snapshot.children {
                var available = true
                let cRoom = currentRoom as! DataSnapshot
                for currentTime in cRoom.children {
                    let cTime = currentTime as! DataSnapshot
                    let timeString = cTime.value as! String
                    let timeArray = timeString.components(separatedBy: " ")
                    let date = timeArray[0]
                    let startTime = timeArray[1]
                    let endTime = timeArray[2]
                    
                    if(date==checkDate) {
                        print(checkStart)
                        print(checkEnd)
                        print(startTime)
                        print(endTime)
                        if (self.checkOverlap(checkStart: checkStart, checkEnd: checkEnd, start: startTime, end: endTime)) {
                            
                            print("Overlap")
                            available = false
                            
                        }
                        else {
                            print("No overlap")
                        }
                    }
                    
                }
                if (available) {
                    self.availableRooms.append(cRoom.key)
                    print(cRoom.key)
                }
            }
        })

        return availableRooms
    }
    
    func checkOverlap(checkStart:String, checkEnd:String, start:String, end:String) -> Bool {
        let checkStartArray = checkStart.components(separatedBy: ":")
        let checkStartHour = Int(checkStartArray[0])
        let checkStartMinute = Int(checkStartArray[1])
        let checkStartValue = checkStartHour! * 60 + checkStartMinute!
        
        let checkEndArray = checkEnd.components(separatedBy: ":")
        let checkEndHour = Int(checkEndArray[0])
        let checkEndMinute = Int(checkEndArray[1])
        let checkEndValue = checkEndHour! * 60 + checkEndMinute!
        
        let startArray = start.components(separatedBy: ":")
        let startHour = Int(startArray[0])
        let startMinute = Int(startArray[1])
        let startValue = startHour! * 60 + startMinute!
        
        let endArray = end.components(separatedBy: ":")
        let endHour = Int(endArray[0])
        let endMinute = Int(endArray[1])
        let endValue = endHour! * 60 + endMinute!
        
        print(checkStartValue)
        print(checkEndValue)
        print(startValue)
        print(endValue)
        
        if (checkStartValue <= endValue && checkEndValue >= startValue) {
            return true
        }
        return false
    }
}
