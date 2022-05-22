//
//  DashboardViewController.swift
//  Room Booking
//
//  Created by Long Lam on 17/5/2022.
//

import Foundation
import UIKit

class DashboardViewController: ViewController {
    
    @IBOutlet weak var upcomingBookingButton: RoundButton!
    @IBOutlet weak var building11Button: RoundButton!
    @IBOutlet weak var building2Button: RoundButton!
    @IBOutlet weak var building6Button: RoundButton!
    @IBOutlet weak var bookByDateButton: RoundButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        upcomingBookingButton.setColors(bgColor: .white, tintColor: .white, titleColor: .black)
        upcomingBookingButton.setTitle("No booking", for: .normal)
        
        let bookRoom = UserDefaults.standard.string(forKey: "room")
        let bookDate = UserDefaults.standard.string(forKey: "date")
        let bookStart = UserDefaults.standard.string(forKey: "start")
        let bookEnd = UserDefaults.standard.string(forKey: "end")
        
        if (bookRoom != nil) {
            upcomingBookingButton.setTitle(bookRoom! + " on " + bookDate! + " at " + bookStart!, for: .normal)
        }
        
        
        building11Button.setColors(bgColor: UIColor.init(named: "SharedBlue")!, tintColor: .white, titleColor: .white)
        building11Button.setTitle(" Building 11", for: .normal)

        building2Button.setColors(bgColor: UIColor.init(named: "SharedBlue")!, tintColor: .white, titleColor: .white)
        building2Button.setTitle(" Building 2", for: .normal)
        
        building6Button.setColors(bgColor: UIColor.init(named: "SharedBlue")!, tintColor: .white, titleColor: .white)
        building6Button.setTitle(" Building 6", for: .normal)
        
        bookByDateButton.setSFImage(SFSymbolSystemName: "calendar", pointSize: 30, placement: .trailing, imagePadding: 5)
        bookByDateButton.setColors(bgColor: UIColor.init(named: "SharedBlue")!, tintColor: .white, titleColor: .white)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBuilding02" {
            let VC = segue.destination as! TimeBookingViewController
            VC.currentBuildingNumber = "02"
        }
        if segue.identifier == "goToBuilding11" {
            let VC = segue.destination as! TimeBookingViewController
            VC.currentBuildingNumber = "11"
        }
        if segue.identifier == "goToBuilding06" {
            let VC = segue.destination as! TimeBookingViewController
            VC.currentBuildingNumber = "06"
        }
    }
    
}
