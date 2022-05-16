//
//  RoundTextField.swift
//  Room Booking
//
//  Created by Tien Long Lam on 16/5/2022.
//

import Foundation
import UIKit
class RoundTextField:UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.borderStyle = .roundedRect
        layer.cornerRadius = 4
        
        self.tintColor = .white
        self.textColor = .black
        
    }
    
    func setSFImage(SFSymbolSystemName:String, pointSize:CGFloat, placement:NSDirectionalRectEdge, imagePadding:CGFloat) {
        let img = UIImage(systemName: SFSymbolSystemName)
        let padding = 8
        let size = 20
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size))
        let imageView = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        imageView.tintColor = .gray
        imageView.image = img
        outerView.addSubview(imageView)

        self.leftView = outerView
        self.leftViewMode = .always
    }
    
}
