//
//  BookingMainViewController.swift
//  Room Booking
//
//  Created by Zachary Meissner on 18/5/2022.
//

import UIKit

class BookingMainViewController: UIViewController {
    @IBOutlet weak var building11Button: RoundButton!
    @IBOutlet weak var building2Button: RoundButton!
    @IBOutlet weak var building6Button: RoundButton!
    
    @IBOutlet weak var myBookingsButton: RoundButton!
    @IBOutlet weak var bookByDateButton: RoundButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bookByDateButton.setSFImage(SFSymbolSystemName: "calendar", pointSize: 20, placement: .trailing, imagePadding: 5)
        bookByDateButton.setColors(bgColor: UIColor.init(named: "SharedBlue")!, tintColor: .white, titleColor: .white)
        bookByDateButton.setTitle("Book By Date", for: .normal)
        myBookingsButton.setColors(bgColor: UIColor.init(named: "SharedBlue")!, tintColor: .white, titleColor: .white)
        myBookingsButton.setTitle("My Bookings", for: .normal)
                    }


}
