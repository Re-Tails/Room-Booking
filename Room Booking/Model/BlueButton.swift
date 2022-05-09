//
//  BlueButton.swift
//  Room Booking
//
//  Created by Tien Long Lam on 9/5/2022.
//

import Foundation
import UIKit
class BlueButton:UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.configuration = UIButton.Configuration.plain()
        layer.cornerRadius = 4
        self.backgroundColor = UIColor(red: 0.0, green: 0.25, blue: 0.8, alpha: 1.0)
        self.setTitleColor(.white, for: .normal)
        self.tintColor = .white
        self.setTitle("test", for: .normal)
        self.setSFImage(SFSymbolSystemName: "arrow.right", pointSize: 20, placement: .trailing, imagePadding: 5)
    }
    
    func setSFImage(SFSymbolSystemName:String, pointSize:CGFloat, placement:NSDirectionalRectEdge, imagePadding:CGFloat) {
        let img = UIImage(systemName: SFSymbolSystemName)
        self.configuration?.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: pointSize)
        self.configuration?.imagePlacement = placement
        self.configuration?.imagePadding = imagePadding
        self.setImage(img, for: .normal)
    }
    
}
