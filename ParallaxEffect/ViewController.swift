//
//  ViewController.swift
//  ParallaxEffect
//
//  Created by Anand Yadav on 14/01/18.
//  Copyright © 2018 Anand Yadav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var backgroundImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImg.layer.cornerRadius = logoImg.frame.height / 2
        logoImg.clipsToBounds = true
        
        applyEffect(onView: backgroundImg, magnitude: 15)
        applyEffect(onView: logoImg, magnitude: -10)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func applyEffect(onView: UIView, magnitude: Double) {
        // X axis
        let xAxisEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xAxisEffect.minimumRelativeValue = -magnitude
        xAxisEffect.maximumRelativeValue = magnitude
        
        // Y Axis
        let yAxisEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yAxisEffect.minimumRelativeValue = -magnitude
        yAxisEffect.maximumRelativeValue = magnitude
        
        let effectGroup = UIMotionEffectGroup()
        effectGroup.motionEffects = [xAxisEffect, yAxisEffect]
        
        onView.addMotionEffect(effectGroup)
    }
}


















