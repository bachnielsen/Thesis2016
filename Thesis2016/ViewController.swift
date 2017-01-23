//
//  ViewController.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 01/11/2016.
//  Copyright © 2016 Niclas Bach Nielsen. All rights reserved.
//

import UIKit
import ResearchKit


class ViewController: UIViewController, ORKTaskViewControllerDelegate, CLLocationManagerDelegate, UIScrollViewDelegate {
    
    let healthManager:HealthManager = HealthManager()
    let scrollView = UIScrollView(frame: UIScreen.main.bounds)
    let navigationBarAppearance = UINavigationBar.appearance()
    let buttonDone = UIButton(type: UIButtonType.custom) as UIButton
    
//    let animLayer = CALayer() // the layer that is going to be animated
//    let cornerRadiusAnim = CABasicAnimation(keyPath: "cornerRadius") // the corner radius reducing animation
//    let widthAnim = CABasicAnimation(keyPath: "bounds.size.width") // the width animation
//    let groupAnim = CAAnimationGroup() // the combination of the corner and width animation
//    let animDuration = TimeInterval(1.0) // the duration of one 'segment' of the animation
//    let layerSize = CGFloat(100) // the width & height of the layer (when it's a square)
    
//    required init?(coder aDecoder: NSCoder) {
//        
//        super.init(coder: aDecoder)
//    }
    
    var isOpen = false
    
    //http://www.appcoda.com/healthkit-introduction/
    var zeroTime = TimeInterval()
    var timer : Timer = Timer()
    
    let locationManager = CLLocationManager()
    var startLocation: CLLocation!
    var lastLocation: CLLocation!
    var distanceTraveled = 0.0
//    var buttonPlay: UIButton!
//    @IBOutlet weak var rolePhysBtn: UIButton!
//    @IBOutlet weak var surveyBtn: UIButton!
//    @IBOutlet weak var consentBtn: UIButton!
//    @IBOutlet weak var physActBtn: UIButton!
//    @IBOutlet weak var bodyPainBtn: UIButton!
//    @IBOutlet weak var distanceLabel: UILabel!
//    @IBOutlet weak var startButton: UIButton!
    
    
    //Start/stop button
//    var launchBool: Bool = false {
//        didSet {
//            if launchBool == true {
//                startButton.setTitle("Stop", for: .normal)
//            } else {
//                startButton.setTitle("Start", for: .normal)
//            }
//        }
//    }
    
//    func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return UIStatusBarStyle.lightContent
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isOpen == true {
            print("The tip is open")
        }
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
//        let bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        let center = view.center
//        
//        // Create CAShapeLayerS
//        let rectShape1 = CAShapeLayer()
//        rectShape1.bounds = bounds
//        rectShape1.position = CGPoint(x: center.x, y: center.y - 120)
//        self.scrollView.layer.addSublayer(rectShape1)
//        let rectShape2 = CAShapeLayer()
//        rectShape2.bounds = bounds
//        rectShape2.position = center
//        self.scrollView.layer.addSublayer(rectShape2)
//        let rectShape3 = CAShapeLayer()
//        rectShape3.bounds = bounds
//        rectShape3.position = CGPoint(x: center.x, y: center.y + 120)
//        self.scrollView.layer.addSublayer(rectShape3)
//        
//        // Apply effects here
//        // 1
//        rectShape1.backgroundColor = UIColor.red.cgColor
//        rectShape1.cornerRadius = 20
//        // 2
//        rectShape2.fillColor = UIColor.green.cgColor
//        rectShape2.path = UIBezierPath(roundedRect: rectShape2.bounds, cornerRadius: 20).cgPath
//        // 3
//        rectShape3.fillColor = UIColor.blue.cgColor
//        rectShape3.path = UIBezierPath(roundedRect: rectShape3.bounds, byRoundingCorners: .bottomLeft /*.topRight*/, cornerRadii: CGSize(width: 20, height: 20)).cgPath
//        let bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        
//        // Create CAShapeLayerS
//        let rectShape = CAShapeLayer()
//        rectShape.bounds = bounds
//        rectShape.position = view.center
//        rectShape.cornerRadius = bounds.width / 2
//        self.scrollView.layer.addSublayer(rectShape)
//        
//        // Apply effects here
//        
//        // fill with yellow
//        rectShape.fillColor = UIColor.yellow.cgColor
//        
//        // 1
//        // begin with a circle with a 50 points radius
//        let startShape = UIBezierPath(roundedRect: bounds, cornerRadius: 50).cgPath
//        // animation end with a large circle with 500 points radius
//        let endShape = UIBezierPath(roundedRect: CGRect(x: -450, y: -450, width: 1000, height: 1000), cornerRadius: 500).cgPath
//        
//        // set initial shape
//        rectShape.path = startShape
//        
//        // 2
//        // animate the `path`
//        let animation = CABasicAnimation(keyPath: "path")
//        animation.toValue = endShape
//        animation.duration = 1 // duration is 1 sec
//        // 3
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
//        animation.fillMode = kCAFillModeBoth // keep to value after finishing
//        animation.isRemovedOnCompletion = true // don't remove after finishing
//        // 4
//        rectShape.add(animation, forKey: animation.keyPath)
        
//        let rect = self.scrollView.frame
//        
//        animLayer.backgroundColor = UIColor.blue.cgColor // color of the layer, feel free to change
//        animLayer.frame = CGRect(x: rect.width-layerSize*0.5, y: rect.height-layerSize*0.5, width: layerSize, height: layerSize)
//        animLayer.cornerRadius = layerSize*0.5;
//        animLayer.anchorPoint = CGPoint(x: 1, y: 1) // sets so that when the width is changed, it goes to the left
//        self.scrollView.layer.addSublayer(animLayer)
//        
//        // decreases the corner radius
//        cornerRadiusAnim.duration = animDuration
//        cornerRadiusAnim.fromValue = animLayer.cornerRadius
//        cornerRadiusAnim.toValue = 0;
//        
//        // inverse of the cornerRadiusAnim
//        cornerRadiusAnim.duration = animDuration
//        cornerRadiusAnim.fromValue = 0;
//        cornerRadiusAnim.toValue = animLayer.cornerRadius
//        
//        // increases the width, and autoreverses on completion
//        widthAnim.duration = animDuration
//        widthAnim.fromValue = animLayer.frame.size.width
//        widthAnim.toValue = rect.size.width
//        widthAnim.autoreverses = true
//        widthAnim.delegate = self
        
        
        
//        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
//        self.setNeedsStatusBarAppearanceUpdate()

        self.title = "Home"
//        self.navigationBarAppearance.
        self.navigationBarAppearance.barTintColor = Colors.flatGreen.color
        self.navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
//        let rightItem = UIImage(named: "settings") as UIImage?
        let rightItem = UIButton(type: .custom)
        rightItem.setImage(UIImage(named: "settings"), for: .normal)
        rightItem.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        rightItem.addTarget(self, action: #selector(btnTouched2), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: rightItem)
        self.navigationItem.setRightBarButton(item1, animated: true) //rightBarButtonItem(item1)// = UIBarButtonItem(rightItem)// (title: "settings", style: .bordered) //, target: self, action: #selector(addTapped))
//        let btnImage = UIImage(named: "Playbutton") as UIImage?
//        buttonPlay = UIButton(type: UIButtonType.custom) as UIButton
//        buttonPlay.translatesAutoresizingMaskIntoConstraints = false
//        buttonPlay.backgroundColor = UIColor.black
//        buttonPlay.setImage(btnImage, for: UIControlState.normal)
//        self.view.addSubview(buttonPlay)
        
//        let buttonPlay = UIButton(type: UIButtonType.custom) as UIButton
        
//        let topRect = DrawRectangles()
//        topRect.draw(CGRect(x: 0, y: 64, width: 375, height: 110), ofColor: UIColor.white, strokeColor: UIColor.clear, inView: scrollView)
        let topRectH = drawRectangle(rect: CGRect(x: 0, y: 64, width: 375, height: 110), ofColor: UIColor.white, strokeColor: UIColor.clear, inView: scrollView)
//        drawRectangle(rect: CGRect(x: 0, y: 64, width: 375, height: 110), ofColor: UIColor.white, strokeColor: UIColor.clear, inView: scrollView)
        

//        print(topRect.rect.frame.height)
        let rectWidth:CGFloat = 37
        let rectHeight:CGFloat = 55
        let rectCornerRadius:CGFloat = 19.0
        
//        let topBarH = topRectH + 84
//        print(topBarH)
        // Find center of actual frame to set rectangle in middle
        let xf:CGFloat = (self.view.frame.width  - rectWidth)  / 2
        let yf:CGFloat = CGFloat(194) //topRect.frame.height - 84 // 194 //(self.view.frame.height - rectHeight) / 2
        
        
        
        let btnImage = UIImage(named: "Playbutton") as UIImage?
        let buttonPlay = UIButton(type: UIButtonType.custom) as UIButton
        buttonPlay.frame = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
        buttonPlay.setImage(btnImage, for: UIControlState.normal)
        buttonPlay.tag = 100
        buttonPlay.addTarget(self, action: #selector(self.btnTouched), for:.touchUpInside)
        
        let btnImageDone = UIImage(named: "done") as UIImage?
//        let buttonDone = UIButton(type: UIButtonType.custom) as UIButton
        buttonDone.frame = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
        buttonDone.setImage(btnImageDone, for: UIControlState.normal)
        buttonDone.tag = 50
        buttonDone.addTarget(self, action: #selector(self.btnTouched), for:.touchUpInside)

        //Top bar
        let labelWidth:CGFloat = 375*0.90
        let labelHeight:CGFloat = 110 / 2
        let labelX:CGFloat = (scrollView.frame.width  - labelWidth) / 2
//        let labelY:CGFloat = (rectangle.frame.height  - labelHeight)  / 2
        
        let topLabel = UILabel(frame: CGRect(x: labelX, y: 64, width: labelWidth, height: labelHeight))
        topLabel.textAlignment = .left
        topLabel.font = UIFont.boldSystemFont(ofSize: 14)// topLabel.font.withSize(14)
        topLabel.text = "Welcome John Appleseed, lets get started"
        topLabel.tag = 100
        
        let subLabelY:CGFloat = 64 + 30 //(topLabel.frame.height - labelHeight) / 2
        let subLabel = UILabel(frame: CGRect(x: labelX, y: subLabelY, width: labelWidth, height: labelHeight))
        subLabel.textAlignment = .left
        subLabel.font = subLabel.font.withSize(12)
        subLabel.numberOfLines = 5
        subLabel.text = "The first step is to answer a 36 question survey to establish your base health related quality of life"
        subLabel.tag = 100


        var startPos = 90
        let startposPrint = yf+CGFloat(startPos)
        print(startposPrint)
        
        // Rounded rectangles - action buttons
        for _ in 1...10 {
            let roundRectTest = drawRoundRect2(rect: CGRect(x: xf, y: yf+CGFloat(startPos), width: rectWidth, height: rectHeight), rectColor: Colors.flatGreen.color.withAlphaComponent(0.20), strokeColor: UIColor.white.withAlphaComponent(0.50), radiusCorner: rectCornerRadius, inView: scrollView)
            roundRectTest.addTarget(self, action: #selector(self.btnInfoOvalTouched), for:.touchUpInside)
            startPos = startPos+90
            print("rounddrect " + String(startPos))
        }
        // Small circles - tip buttons
        var startPosOval = 65//buttonPlay.frame.height + CGFloat(30) //65 // (roundRect height + 30% af roundrect startpos)
        let xfOval:CGFloat = (self.view.frame.width  - 13)  / 2
        for _ in 1...5{
            let ovalInfo = drawInfoOval(placementX: xfOval, placementY: yf+CGFloat(startPosOval))
            ovalInfo.addTarget(self, action: #selector(self.btnInfoOvalTouched), for:.touchUpInside)
            startPosOval = startPosOval + 90
            print("oval " + String(describing: startPosOval))
        }
        
        //Timeline
        drawLineFromPoint(start: CGPoint(x: (self.view.frame.width) / 2, y: 110), toPoint: CGPoint(x: (self.view.frame.width) / 2, y: 1667), ofColor: UIColor.white, inView: scrollView)
//        stepResultForStepIdentifier(stepIdentifier: qComplete)
        
        self.scrollView.addSubview(topLabel)
        self.scrollView.addSubview(subLabel)
        self.scrollView.addSubview(buttonPlay)


//        if buttonPlay.isDescendant(of: self.scrollView){// subviews[buttonPlay]{
//            print("is there")
//        }else {
//            self.scrollView.addSubview(buttonDone)
//            print("added buttonDone")
//        }
//        if buttonPlay.tag == 100 {
//            self.scrollView.addSubview(buttonDone)
//        }
        
//        let width = NSLayoutConstraint(item: buttonPlay, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 37)
//        let height = NSLayoutConstraint(item: buttonPlay, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 525)
//        buttonPlay.addConstraint(width)
//        buttonPlay.addConstraint(height)
//        let x = NSLayoutConstraint(item: buttonPlay, attribute: .centerX, relatedBy: .equal, toItem: self.scrollView, attribute: .centerX, multiplier: 1, constant: 0)
//        let y = NSLayoutConstraint(item: buttonPlay, attribute: .centerY, relatedBy: .equal, toItem: self.scrollView, attribute: .centerY, multiplier: 1, constant: 0)
//        NSLayoutConstraint.activate([width,height])
//        self.scrollView.addConstraint(x)
//        self.scrollView.addConstraint(y)
//        let buttonPlayVertConstraints = NSLayoutConstraint(item: buttonPlay, attribute: .bottom, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        
//        NSLayoutConstraint.activate([buttonPlayVertConstraints])
        
        // Do any additional setup after loading the view, typically from a nib.
        
//        startButton.setTitle("Start", for: .normal)
//        self.scrollView.addSubview(startButton)
        
        //http://www.appcoda.com/healthkit-introduction/
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Need to Enable Location")
        }
        
        // We cannot access the user's HealthKit data without specific permission.
        authorizeHealthKit()
    }
//    func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        widthAnim.beginTime = CACurrentMediaTime()+animDuration // starts after the corner radius anim has finished
//        
//        animLayer.add(widthAnim, forKey: "widthAnim")
//        animLayer.add(cornerRadiusAnim, forKey: "cornerRadius")
//        
//        CATransaction.begin()
//        CATransaction.setDisableActions(true) // disables implicit animations
//        animLayer.cornerRadius = 0
//        CATransaction.commit()
//    }
//    
//    func animationDidStop(anim: CAAnimation, finished flag: Bool) {
//        
//        animLayer.add(cornerRadiusAnim, forKey: "cornerRadiusUndo")
//        
//        CATransaction.begin()
//        CATransaction.setDisableActions(true)
//        animLayer.cornerRadius = layerSize*0.5
//        CATransaction.commit()
//    }
    
    func drawInfoOval(placementX: CGFloat, placementY: CGFloat) -> UIButton{
        let btnInfoOval = UIButton(type: UIButtonType.custom) as UIButton
        btnInfoOval.frame = CGRect(x: placementX, y: placementY, width: 13, height: 13)
        btnInfoOval.layer.cornerRadius = 0.5 * btnInfoOval.bounds.size.width
        btnInfoOval.layer.borderWidth = 1.0
        btnInfoOval.layer.borderColor = UIColor.white.cgColor
        btnInfoOval.backgroundColor = Colors.flatGreen.color
        
        self.scrollView.addSubview(btnInfoOval)
        return btnInfoOval
    }
    func drawTipLabel(placementX: CGFloat, placementY: CGFloat) -> UILabel {//, UILabel) {
        let label = UILabel(frame: CGRect(x: placementX, y: placementY, width: 355, height: 20))
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)// topLabel.font.withSize(14)
        label.text = "Today's tip from WHO:\n"
//        label.text = label.text!+text!
        
//        let label2 = UILabel(frame: CGRect(x: placementX, y: placementY, width: 355, height: 90))
//        label2.textAlignment = .left
//        label2.font = UIFont.systemFont(ofSize: 10)
//        label2.text = text
//        label.text += text
//        label.text?.append(text)
//        topLabel.tag = 100
        
        return label
    }
    func drawTipSubLabel(placementX: CGFloat, placementY: CGFloat, text: String? = nil) -> UILabel {
        var label = UILabel(frame: CGRect(x: placementX, y: placementY, width: 355, height: 80))
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = text
        return label
    }
    
    func drawRoundRect2(rect: CGRect, rectColor rectBgColor: UIColor, strokeColor lineColor: UIColor, radiusCorner rectCornerRadius: CGFloat, inView view:UIView) -> UIButton
    {
        let btnRoundRect = UIButton(type: UIButtonType.custom) as UIButton
        
        // http://stackoverflow.com/questions/30368739/how-to-draw-a-simple-rounded-rect-in-swift-rounded-corners
//        let clipPath: CGPath = UIBezierPath(roundedRect: rect, cornerRadius: rectCornerRadius).cgPath
        
        btnRoundRect.frame = rect //CGRect(x: x, y: y, width: w, height: h) //CGRect(rect: rect)//, cornerRadius: rectCornerRadius)// clipPath
        btnRoundRect.layer.cornerRadius = rectCornerRadius
        btnRoundRect.layer.borderWidth = 2.0
        btnRoundRect.layer.borderColor = lineColor.cgColor
        btnRoundRect.backgroundColor = rectBgColor
        
        //design path in layer
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = clipPath
//        shapeLayer.fillColor = rectBgColor.cgColor
//        shapeLayer.strokeColor = lineColor.cgColor
//        shapeLayer.lineWidth = 2.0
        
        self.scrollView.addSubview(btnRoundRect)
        return btnRoundRect
    }
    func drawRoundRect(rect : CGRect, rectColor rectBgColor: UIColor, strokeColor lineColor: UIColor, radiusCorner rectCornerRadius: CGFloat, inView view:UIView)
    {
        // Example use:
        //drawRoundRect(rect: CGRect(x: xf, y: yf+CGFloat(startPos), width: rectWidth, height: rectHeight), rectColor: Colors.flatGreen.color.withAlphaComponent(0.20), strokeColor: UIColor.white.withAlphaComponent(0.20), radiusCorner: rectCornerRadius, inView: scrollView)
        // http://stackoverflow.com/questions/30368739/how-to-draw-a-simple-rounded-rect-in-swift-rounded-corners
        let clipPath: CGPath = UIBezierPath(roundedRect: rect, cornerRadius: rectCornerRadius).cgPath
        
        //design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = clipPath
        shapeLayer.fillColor = rectBgColor.cgColor
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 2.0

        self.scrollView.layer.addSublayer(shapeLayer)
    }
    
    func drawRectangle(rect : CGRect, ofColor rectColor: UIColor, strokeColor lineColor: UIColor, inView view:UIView) -> CGRect {//-> Int {
        let height = rect.height
        print(height)
        let path = UIBezierPath(rect: rect)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = rectColor.cgColor
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 2.0
        
        self.scrollView.layer.addSublayer(shapeLayer)
        return rect
//        return Int(height)
    }
    func drawCircle(center ovalCenter: CGPoint, radius ovalRadius: CGFloat, ofColor ovalColor: UIColor, strokeColor lineColor: UIColor, inView view:UIView) {
        let circlePath = UIBezierPath(arcCenter: ovalCenter, radius: ovalRadius, startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
//        let circlePath = UIBezierPath( )
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = ovalColor.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = lineColor.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 1.0
        
//        view.layer.addSublayer(shapeLayer)
        self.scrollView.layer.addSublayer(shapeLayer)
    }

    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        
        //design the path
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        //design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 2.0
        
        self.scrollView.layer.addSublayer(shapeLayer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.addSubview(scrollView)
        
        self.scrollView.contentSize = CGSize(width:375, height: 1667)
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.backgroundColor = Colors.testGreenBg.color
//        self.scrollView.bounces = false
        
//        self.scrollView.addSubview(rolePhysBtn)
//        self.scrollView.addSubview(surveyBtn)
//        self.scrollView.addSubview(consentBtn)
//        self.scrollView.addSubview(physActBtn)
//        self.scrollView.addSubview(bodyPainBtn)
//        self.scrollView.addSubview(distanceLabel)
//        self.scrollView.addSubview(startButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func authorizeHealthKit()
    {
        healthManager.authorizeHealthKit { (authorized,  error) -> Void in
            if authorized {
                print("HealthKit authorization received.")
            }
            else
            {
                print("HealthKit authorization denied!")
                if error != nil {
                    print("\(error)")
                }
            }
        }
    }
    
//    @IBAction func startDistance(sender : AnyObject!) {
//        launchBool = !launchBool
//        if launchBool == true {
//            distanceTraveled = 0.0
//            startLocation = nil
//            lastLocation = nil
//            
//            locationManager.startUpdatingLocation()
//        }else{
//            print("Stopped")
//            locationManager.stopUpdatingLocation()
//        }
//        
//    }
    func btnInfoOvalDone(sender: AnyObject!) {
        print("Done!")
        let ovalInfo = sender as! UIButton
        for viewWithTag in self.scrollView.subviews{
            if let viewWithTag = self.scrollView.viewWithTag(45) {
                viewWithTag.removeFromSuperview()
            }
        }
//        let newVie = btnInfoOvalTouched.newView
//        newView.removeFromSuperview()
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseOut, animations: {
            
            ovalInfo.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//            self.scrollView.addSubview(ovalInfo)
        }, completion: { finished in
            print("Basket doors opened!")
        })
        
        ovalInfo.removeTarget(self, action: #selector(self.btnInfoOvalDone), for: .touchUpInside)
        ovalInfo.addTarget(self, action: #selector(self.btnInfoOvalTouched(sender:)), for:.touchUpInside)
        ovalInfo.tag = 55
        
    }
    func btnInfoOvalTouched(sender: AnyObject!){
//        var isOpen = false
        // Your action
        print ("Touched")
        //        let buttonPlay = sender as! UIButton
        //        let btnInfoOval = sender as! UIButton
        let infoCirc = sender as! UIButton
        let ovalInfo = sender as! UIButton
//        let bottomConstraint =
        //        var rectTestLOL = CGRect(x: 0, y: ovalInfo.frame.origin.y + CGFloat(13), width: 375, height: 0) //self.drawRectangle(rect: CGRect(x: 0, y: ovalInfo.frame.origin.y + CGFloat(13), width: 375, height: 0), ofColor: UIColor.white, strokeColor: UIColor.clear, inView: self.scrollView)
//        self.nameInputConstraint.constant = 8
//        var initialConstraints = [NSLayoutConstraint]()
        
        
        
        let newView = UIView(frame: CGRect(x: 0, y: ovalInfo.frame.origin.y + CGFloat(6.5), width: 375, height: 110))
        newView.backgroundColor = UIColor.white
//        newView.translatesAutoresizingMaskIntoConstraints = false
//        newView.translatesAutoresizingMaskIntoConstraints = true
//        self.scrollView.addSubview(newView)
        newView.center = CGPoint(x: 187.5, y: ovalInfo.frame.origin.y + CGFloat(55))
//        //Leading
//        newView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        //trailing
//        newView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //Height
//        newView.heightAnchor.constraint(equalTo: newView.heightAnchor, multiplier: 0.65).isActive = true
        self.scrollView.addSubview(newView)
        
        let tipLabel = drawTipLabel(placementX: newView.frame.origin.x + 10, placementY: newView.frame.origin.y + 10)
        let tipSubLabel = drawTipSubLabel(placementX: newView.frame.origin.x + 10, placementY: newView.frame.origin.y + 30, text: "Try to exercise throughout the week. Exercise makes your heart stronger and can help you avoid symptoms. Walking is a great way to get exercise. If your doctor says it's safe, start out with some short walks.")
        tipSubLabel.numberOfLines = 5
//        tipLabel.backgroundColor = UIColor.brown
//        tipSubLabel.backgroundColor = UIColor.gray
//        let tipSubLabelString = String("use paper towels")
//        tipLabel.text = tipLabel.text! + tipSubLabelString!
        tipLabel.tag = 45
        tipSubLabel.tag = 45
        
        self.scrollView.addSubview(tipLabel)
        self.scrollView.addSubview(tipSubLabel)
        
//        self.scrollView.addSubview(tipSubLabel)
        newView.tag = 45
//        ovalInfo.tag = 45
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseOut, animations: {
            
            ovalInfo.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.scrollView.bringSubview(toFront: ovalInfo)
            
//            self.scrollView.layoutIfNeeded()
            
//            let rectTest = self.drawRectangle(rect: CGRect(x: 0, y: ovalInfo.frame.origin.y + CGFloat(13), width: 375, height: 110), ofColor: UIColor.white, strokeColor: UIColor.clear, inView: self.scrollView)
            
//            let bottomConstraint = rectTest.
//            NSLayoutConstraint(item: recTest, attribute: .bottom, relatedBy: .equal, toItem: ovalInfo, attribute: .bottom, multiplier: 5.0, constant: 5.0).isActive = true
            
//            self.scrollView.addSubview(ovalInfo)
        }, completion: { (finished: Bool) in
            print("Basket doors opened!")
            self.isOpen = true
        })
        ovalInfo.removeTarget(self, action: #selector(self.btnInfoOvalTouched), for: .touchUpInside)
        ovalInfo.addTarget(self, action: #selector(self.btnInfoOvalDone), for:.touchUpInside)
    }
    
    
    func btnTouched(sender: AnyObject!){
        // Your action
        print ("Touched")
        let buttonPlay = sender as! UIButton
        let infoCirc = sender as! UIButton
        UIView.animate(withDuration: 0.6,
                       animations: {
                        buttonPlay.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            buttonPlay.transform = CGAffineTransform.identity
                        }
        })
        let taskViewController = ORKTaskViewController(task: SF36, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)

    }
    func btnTouched2(sender: AnyObject!){
        // Your action
        print ("Touched")
        let buttonPlay = sender as! UIButton
        let infoCirc = sender as! UIButton
        let rightItem = sender as! UIButton
        let item1 = sender as! UIButton
        let settingsViewController = SettingsViewController()

        
        self.present(settingsViewController, animated: true, completion: nil) //SettingsViewController()
        
    }

//    @IBAction func btnPushButton(button: PlayButtonView) {
//        let taskViewController = ORKTaskViewController(task: PhysicalFunctioningTask, taskRun: nil)
//        taskViewController.delegate = self
//        present(taskViewController, animated: true, completion: nil)   
//    }
    
    @IBAction func consentTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
//    @IBAction func playBtnPushed(_ sender: PlayButtonView) {
//        let taskViewController = ORKTaskViewController(task: PhysicalFunctioningTask, taskRun: nil)
//        taskViewController.delegate = self
//        present(taskViewController, animated: true, completion: nil)
//    }
    
    @IBAction func surveyTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    @IBAction func physActTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: PhysTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func bodilyPainTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: BodilyPainTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }

    @IBAction func RFPhysTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: SF36, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if startLocation == nil {
            startLocation = locations.first as CLLocation!
        } else {
            let lastDistance = lastLocation.distance(from: locations.last as CLLocation!)
            distanceTraveled += lastDistance * 0.001
            
            let trimmedDistance = String(format: "%.2f", distanceTraveled)
//            distanceLabel.text = "\(trimmedDistance) m"
            //distanceLabel.text = "\(distanceTraveled) m"
        }
        
        lastLocation = locations.last as CLLocation!
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        print("didFinishWithReason")
    
        switch reason {
            
        case ORKTaskViewControllerFinishReason.completed:
            print("completed")
            for viewWithTag in self.scrollView.subviews{
                if let viewWithTag = self.scrollView.viewWithTag(100) {
                    viewWithTag.removeFromSuperview()
                }
                // else {
//                    self.scrollView.addSubview(buttonDone)
////                    viewWithTag.addSubview(self.scrollView.viewWithTag(50)!)
//                }
//                if let viewWithTag = self.scrollView.viewWithTag(100){
//                    viewWithTag.removeFromSuperview()
//                } else if viewWithTag = self.scrollView.viewWithTag(50)
//                
                
//                viewWithTag.addSubview(viewWithTag(50)

            }
            let doneLabel = drawTipSubLabel(placementX: 217.5 /*view.frame.width / 2*/, placementY: 179, text: "2nd jan\nScore: 54.9")
//            doneLabel.backgroundColor = UIColor.brown
            doneLabel.numberOfLines = 2
            doneLabel.adjustsFontSizeToFitWidth = true
    
            self.scrollView.addSubview(doneLabel)
            self.scrollView.addSubview(self.buttonDone)
//            for viewWithTag in self.scrollView.subviews{
//                if let viewWithTag = self.scrollView.viewWithTag(50){
//                    viewWithTag.addSubview(viewWithTag)
//                }
//            }
            
//            self.scrollView.addSubview(buttonDone)
        case ORKTaskViewControllerFinishReason.failed:
            print("failed")
        case ORKTaskViewControllerFinishReason.discarded:
            print("discarded")
        case ORKTaskViewControllerFinishReason.saved:
            print("saved")
        }
        
//        if reason == .completed{
//            let viewWithTag = self.scrollView.viewWithTag(100)
//            viewWithTag?.removeFromSuperview()
//        }
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
    // Healthkit Access Object
//    let healthkitStore:HealthkitStore = HKHealthStore()



}

