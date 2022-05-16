//
//  BlueButton.swift
//  Room Booking
//
//  Created by Tien Long Lam on 9/5/2022.
//

import Foundation
import UIKit
class RoundButton:UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configuration = UIButton.Configuration.plain()
        layer.cornerRadius = 4
        
    }
    
    func setColors(bgColor:UIColor, tintColor:UIColor, titleColor:UIColor) {
        self.backgroundColor = bgColor
        self.setTitleColor(titleColor, for: .normal)
        self.tintColor = tintColor
    }
    
    func setSFImage(SFSymbolSystemName:String, pointSize:CGFloat, placement:NSDirectionalRectEdge, imagePadding:CGFloat) {
        let img = UIImage(systemName: SFSymbolSystemName)
        self.configuration?.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: pointSize)
        self.configuration?.imagePlacement = placement
        self.configuration?.imagePadding = imagePadding
        self.setImage(img, for: .normal)
    }
    
}
