//
//  LoginViewController.swift
//  Room Booking
//
//  Created by Tien Long Lam on 16/5/2022.
//

import Foundation
import UIKit

class LoginViewController: ViewController {

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
    }


}
