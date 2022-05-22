//
//  LoginViewController.swift
//  Room Booking
//
//  Created by Tien Long Lam on 16/5/2022.
//

import Foundation
import UIKit

class LoginViewController: ViewController {
    
    let bd = BookingDatabase()

    @IBOutlet weak var passwordTextField: RoundTextField!
    @IBOutlet weak var studentIDTextField: RoundTextField!
    @IBOutlet weak var loginButton: RoundButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.setSFImage(SFSymbolSystemName: "arrow.right", pointSize: 20, placement: .trailing, imagePadding: 5)
        loginButton.setColors(bgColor: UIColor.init(named: "SharedBlue")!, tintColor: .white, titleColor: .white)
        loginButton.setTitle("Login", for: .normal)
        
        studentIDTextField.setSFImage(SFSymbolSystemName: "person", pointSize: 20, placement: .trailing, imagePadding: 5)
        
        passwordTextField.setSFImage(SFSymbolSystemName: "lock", pointSize: 20, placement: .trailing, imagePadding: 5)
        
        //bd.deleteBooking(booking: test)
        let b1: Booking = Booking("06_06_113", "12:00", "13:00")
        let b2: Booking = Booking("01_02_123", "13:00", "14:00")
        let b3: Booking = Booking("05_05_101", "13:30", "15:00")
        
        bd.addBooking(booking: b1)
        bd.addBooking(booking: b2)
        bd.addBooking(booking: b3)
        bd.addBooking(booking: Booking("06_06_113", "13:50", "12:33"))
        
        //bd.fetchTimes(booking: b2, completionHandler: {
            //print("times from booking (\(b2)): \(self.bd.times)")
        //})
        //self.bd.getBooking(booking: test)
        //print("testiboi", self.bd.testiboi)
    }


}
