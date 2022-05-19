//
//  SearchBookingViewController.swift
//  Room Booking
//
//  Created by Zachary Meissner on 19/5/2022.
//
import UIKit

class SearchBookingViewController: UIViewController {

    @IBOutlet weak var dateTextField: RoundTextField!
    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var bookingStack: UIStackView!
    @IBOutlet weak var searchButton: RoundButton!
    @IBOutlet weak var toTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchButton.setColors(bgColor: UIColor.init(named: "SharedBlue")!, tintColor: .white, titleColor: .white)
        searchButton.setTitle("Search", for: .normal)
        dateTextField.setSFImage(SFSymbolSystemName: "calender", pointSize: 20, placement: .trailing, imagePadding: 5)
        //for i in 0...5 {
        //let label = UILabel(frame: CGRect(x: 0, y: i * 30, width: 200, height: 21))
        //label.center = CGPoint(x: 160, y: 285)
       // label.textAlignment = .center
       // label.text = "I'm a test label"

    let label = RoundTextField()
        
        
      //  }
    let bookingView = BookingController()
        bookingView.setImage(imageNo: "image 3");
        bookingView.setBuildingNo(buildingNo: 11, floorNo: 4, roomNo: 405)
        bookingView.setDate(date: 1862022)
        bookingView.setStartEnd(start: 10, end: 14)
     //   self.bookingStack.addSubview(bookingView)
    }
    

}

