//
//  ListingNavigationController.swift
//  bookXCHANGE
//
//  Created by Eric Chu on 2/17/19.
//  Copyright © 2019 Eric Chu. All rights reserved.
//

import Foundation
import UIKit

class ListingNavigationController: UINavigationController, UITextFieldDelegate{
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        let topColor = UIColor(red: (33/255.0), green: (51/255.0), blue: (87/255.0), alpha: 1)
        
        let bottomColor = UIColor(red: (72/255.0), green: (109/255.0), blue: (180/255.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        
        let gradientLocations: [Float] = [0.0,1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        
        
    }
    
    
}


