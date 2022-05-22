//
//  TimeLabel.swift
//  Room Booking
//
//  Created by Zachary Meissner on 22/5/2022.
//

import Foundation
import UIKit

struct timelabel{

}

class timelabellabel: UILabel {
    var hour = 11
    var minute = 30
    
let timeLabel: UILabel = {
   let label = UILabel()
   //var minute = 3
   //var hour = 4
   label.textColor = UIColor.black
   label.font = UIFont.systemFont(ofSize:(18))
   label.text = "\(hour):\(minute)"
   label.translatesAutoresizingMaskIntoConstraints = false
   return label
}()
}
