//
//  DrawRectangles.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 16/01/2017.
//  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
//

import UIKit

class DrawRectangles: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
//        let h = frame.height
//        let w = frame.width
//        let color:UIColor = UIColor.red
        
        //let drect = CGRect(x: w, y: h, width: w, height: h)
//        let bpath:UIBezierPath = UIBezierPath(rect: rect)
        
//        color.set()
//        bpath.stroke()
        
        let path = UIBezierPath(rect: rect)
        UIColor.gray.setStroke()
        UIColor.white.setFill()
        path.fill()
        path.stroke()
    }

}
