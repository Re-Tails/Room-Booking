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
        
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global(qos: .userInitiated).async {
            // Do work asyncly and call group.leave() after you are done
            let test: Booking = Booking("06_06_113", "12:00", "13:00")
            self.bd.addBooking(booking: test)
            self.bd.getBooking(booking: test)
            group.leave()
        }
        group.notify(queue: .main, execute: {
            // This will be called when block ends
            print("testiboi", self.bd.testiboi)
        })
        
        // NEED A DELAY FOR NO REASON
        
        //let seconds = 0.1
        //DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            //print(self.bd.testiboi)
        //}
    }


}
