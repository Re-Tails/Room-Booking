//
//  Booking.swift
//  Room Booking
//
//  Created by Zachary Meissner on 19/5/2022.
//

import Foundation
import UIKit


class BookingController:UIView{
    

    //BookingController.frame =  CGRect(x:0, y: 0, width:400, height:300)
    var imageNo : String?
    var buildNo : Int?
    var floorNo : Int?
    var roomNo : Int?
    var start : Int?
    var end : Int?
    
    
    
    func setImage(imageNo: String!){
        let imageV = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 150))
        let padding = 8
        let size = 20
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size))
        imageV.center = outerView.center
        imageV.layer.cornerRadius = 10
        imageV.clipsToBounds = true
        imageV.layer.borderWidth = 2.0
        imageV.layer.borderColor = UIColor.red.cgColor
        imageV.image = UIImage(named: imageNo, in: Bundle(for: type(of: self)), compatibleWith: nil)
        outerView.addSubview(imageV)
    }
    
    func setBuildingNo(buildingNo: Int!, floorNo: Int!, roomNo: Int!){
        let roomlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        roomlabel.center = CGPoint(x: 160, y: 285)
        roomlabel.textAlignment = .center
        roomlabel.text = "\(buildingNo).\(floorNo).\(roomNo)"
    }
    
    func setDate(date: Int!){
        let datelabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        datelabel.center = CGPoint(x: 160, y: 285)
        datelabel.textAlignment = .center
        datelabel.text = "\(date)"
    }
    
    func setStartEnd(start: Int!, end: Int!){
        let timelabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        timelabel.center = CGPoint(x: 160, y: 285)
        timelabel.textAlignment = .center
        timelabel.text = "\(start) - \(end)"
    }
    
    //https://blog.instabug.com/nslayoutconstraint-programmatically/
    
}
