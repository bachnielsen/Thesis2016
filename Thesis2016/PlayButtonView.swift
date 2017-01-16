////
////  PlayButtonView.swift
////  Thesis2016
////
////  Created by Niclas Bach Nielsen on 16/01/2017.
////  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
////
//
//import UIKit
//import ResearchKit
//@IBDesignable
//
//
//
//class PlayButtonView: UIButton {
//
//    /*
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
//    */
////    var playButton: UIBarButtonItem!
//    
//    
//    override func draw(_ buttonPlay: CGRect) {
//        super.draw(buttonPlay)
//        
////        // Size of rounded rectangle
////        let rectWidth:CGFloat = 33
////        let rectHeight:CGFloat = 51
//////        let rectCornerRadius:CGFloat = 19.0
////        
////        // Find center of actual frame to set rectangle in middle
////        let xf:CGFloat = (self.frame.width  - rectWidth)  / 2
////        let yf:CGFloat = (self.frame.height - rectHeight) / 2
////        
////        
////        let btnImage = UIImage(named: "Playbutton") as UIImage?
////        let buttonPlay = UIButton(type: UIButtonType.custom) as UIButton
////        buttonPlay.frame = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
////        buttonPlay.setImage(btnImage, for: UIControlState.normal)
//////        buttonPlay.addTarget(self, action: "btnTouched:", for:.touchUpInside)
////        self.addSubview(buttonPlay)
//        
////        let ctx: CGContext = UIGraphicsGetCurrentContext()!
////        ctx.saveGState()
////        
////        let rect = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
////        let clipPath: CGPath = UIBezierPath(roundedRect: rect, cornerRadius: rectCornerRadius).cgPath
////        
//////        rect.setImage(btnImage , for: UIControlState.normal)
////        
////        ctx.addPath(clipPath)
////        ctx.setFillColor(Colors.flatGreen.color.cgColor)
////        
//////        playButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: nil)
////        
////        ctx.closePath()
////        ctx.fillPath()
////        ctx.restoreGState()
//        
//        
////        buttonPlay.addSubview(btnImage)
//    }
//}
