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
    
//    required init?(coder aDecoder: NSCoder) {
//        
//        super.init(coder: aDecoder)
//    }
    
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
//        self.navigationBarAppearance.
        navigationBarAppearance.barTintColor = Colors.flatGreen.color
        navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
//        let btnImage = UIImage(named: "Playbutton") as UIImage?
//        buttonPlay = UIButton(type: UIButtonType.custom) as UIButton
//        buttonPlay.translatesAutoresizingMaskIntoConstraints = false
//        buttonPlay.backgroundColor = UIColor.black
//        buttonPlay.setImage(btnImage, for: UIControlState.normal)
//        self.view.addSubview(buttonPlay)
        
//        let buttonPlay = UIButton(type: UIButtonType.custom) as UIButton
        
        let topRect = DrawRectangles()
        topRect.draw(CGRect(x: 0, y: 64, width: 375, height: 110), ofColor: UIColor.white, strokeColor: UIColor.clear, inView: scrollView)
        
        let rectWidth:CGFloat = 37
        let rectHeight:CGFloat = 55
        let rectCornerRadius:CGFloat = 19.0
        
        // Find center of actual frame to set rectangle in middle
        let xf:CGFloat = (self.view.frame.width  - rectWidth)  / 2
        let yf:CGFloat = topRect.frame.height + 64 //(self.view.frame.height - rectHeight) / 2

        let btnImage = UIImage(named: "Playbutton") as UIImage?
        let buttonPlay = UIButton(type: UIButtonType.custom) as UIButton
        buttonPlay.frame = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
        buttonPlay.setImage(btnImage, for: UIControlState.normal)
        buttonPlay.tag = 100
        buttonPlay.addTarget(self, action: #selector(self.btnTouched), for:.touchUpInside)
        
        //Top bar
        let labelWidth:CGFloat = 375*0.90
        let labelHeight:CGFloat = 110 / 2
        let labelX:CGFloat = (scrollView.frame.width  - labelWidth) / 2
//        let labelY:CGFloat = (rectangle.frame.height  - labelHeight)  / 2
        
        let topLabel = UILabel(frame: CGRect(x: labelX, y: 64, width: labelWidth, height: labelHeight))
        topLabel.textAlignment = .left
        topLabel.font = UIFont.boldSystemFont(ofSize: 14)// topLabel.font.withSize(14)
        topLabel.text = "Welcome, lets get started"
        topLabel.tag = 100
        
        let subLabelY:CGFloat = 64 + 30 //(topLabel.frame.height - labelHeight) / 2
        let subLabel = UILabel(frame: CGRect(x: labelX, y: subLabelY, width: labelWidth, height: labelHeight))
        subLabel.textAlignment = .left
        subLabel.font = subLabel.font.withSize(12)
        subLabel.numberOfLines = 5
        subLabel.text = "The first step is to answer a 36 question survey to establish your base health related quality of life"
        subLabel.tag = 100

        drawLineFromPoint(start: CGPoint(x: (self.view.frame.width) / 2, y: 110), toPoint: CGPoint(x: (self.view.frame.width) / 2, y: 1667), ofColor: UIColor.white, inView: scrollView)
        var startPos = 90
        for _ in 1...10 {
            drawRoundRect(rect: CGRect(x: xf, y: yf+CGFloat(startPos), width: rectWidth, height: rectHeight), rectColor: Colors.flatGreen.color, strokeColor: UIColor.white, radiusCorner: rectCornerRadius, inView: scrollView)
            startPos = startPos+110
        }
//        stepResultForStepIdentifier(stepIdentifier: qComplete)
        

        
        self.scrollView.addSubview(topLabel)
        self.scrollView.addSubview(subLabel)
        self.scrollView.addSubview(buttonPlay)
        
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
    
    func drawRoundRect(rect : CGRect, rectColor rectBgColor: UIColor, strokeColor lineColor: UIColor, radiusCorner rectCornerRadius: CGFloat, inView view:UIView)
    {
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
    
    func drawRectangle(rect : CGRect, ofColor rectColor: UIColor, strokeColor lineColor: UIColor, inView view:UIView){
        
        let path = UIBezierPath(rect: rect)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = rectColor.cgColor
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 2.0
        
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
    func btnTouched(sender: AnyObject!){
        // Your action
        print ("Touched")
        let taskViewController = ORKTaskViewController(task: SF36, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
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
        
//        if reason == .completed{
//            let viewWithTag = self.scrollView.viewWithTag(100)
//            viewWithTag?.removeFromSuperview()
//        }
        switch reason {
            
        case ORKTaskViewControllerFinishReason.completed:
            print("completed")
            for viewWithTag in self.scrollView.subviews{
                viewWithTag.removeFromSuperview()
            }
        case ORKTaskViewControllerFinishReason.failed:
            print("failed")
        case ORKTaskViewControllerFinishReason.discarded:
            print("discarded")
        case ORKTaskViewControllerFinishReason.saved:
            print("saved")
        }
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
    // Healthkit Access Object
//    let healthkitStore:HealthkitStore = HKHealthStore()



}


