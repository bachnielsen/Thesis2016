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
//    let navigationBarAppearace = UINavigationBar.appearance()
    
    
    
    //http://www.appcoda.com/healthkit-introduction/
    var zeroTime = TimeInterval()
    var timer : Timer = Timer()
    
    let locationManager = CLLocationManager()
    var startLocation: CLLocation!
    var lastLocation: CLLocation!
    var distanceTraveled = 0.0
    @IBOutlet weak var rolePhysBtn: UIButton!
    @IBOutlet weak var surveyBtn: UIButton!
    @IBOutlet weak var consentBtn: UIButton!
    @IBOutlet weak var physActBtn: UIButton!
    @IBOutlet weak var bodyPainBtn: UIButton!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    //Start/stop button
    var launchBool: Bool = false {
        didSet {
            if launchBool == true {
                startButton.setTitle("Stop", for: .normal)
            } else {
                startButton.setTitle("Start", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        //UINavigationBar.appearance().barTintColor = Colors.flatGreen.color
//        self.navigationBarAppearace.tintColor = UIColor.white
//        self.navigationBarAppearace.barTintColor = Colors.flatGreen.color
//        
//        self.navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
//        
        self.title = "Hearty"

      
        
        let btnImage = UIImage(named: "Playbutton") as UIImage?
        let buttonPlay = UIButton(type: UIButtonType.custom) as UIButton
        let rectWidth:CGFloat = 33
        let rectHeight:CGFloat = 51
        //        let rectCornerRadius:CGFloat = 19.0
        
        // Find center of actual frame to set rectangle in middle
        let xf:CGFloat = (self.view.frame.width  - rectWidth)  / 2
        let yf:CGFloat = (self.view.frame.height - rectHeight) / 2
        
        
        
        buttonPlay.frame = CGRect(x: xf, y: yf, width: rectWidth, height: rectHeight)
        buttonPlay.setImage(btnImage, for: UIControlState.normal)
        buttonPlay.addTarget(self, action: #selector(self.btnTouched), for:.touchUpInside)
        self.scrollView.addSubview(buttonPlay)

        
        //Top bar

        let k = DrawRectangles(frame: CGRect(x: 0, y: 50, width: 375, height: 110))

        
        self.scrollView.addSubview(k)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        startButton.setTitle("Start", for: .normal)
        self.scrollView.addSubview(startButton)
        
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

//    func drawRectangle(_: color)
//    {
//        let h = frame.height
//        let w = frame.width
//        let color:UIColor = UIColor.yellow
//        
//        let drect = CGRect(x: (w * 0.25), y: (h * 0.25), width: (w * 0.5), height: (h * 0.5))
//        let bpath:UIBezierPath = UIBezierPath(rect: drect)
//        
//        color.set()
//        bpath.stroke()
//        
//        print("it ran")
//        NSLog("drawRect has updated the view")
//    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.addSubview(scrollView)
        
        self.scrollView.contentSize = CGSize(width:375, height: 1667)
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.bounces = false
        
        self.scrollView.addSubview(rolePhysBtn)
        self.scrollView.addSubview(surveyBtn)
        self.scrollView.addSubview(consentBtn)
        self.scrollView.addSubview(physActBtn)
        self.scrollView.addSubview(bodyPainBtn)
        self.scrollView.addSubview(distanceLabel)
        self.scrollView.addSubview(startButton)
        
        
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
    
    @IBAction func startDistance(sender : AnyObject!) {
        launchBool = !launchBool
        if launchBool == true {
            distanceTraveled = 0.0
            startLocation = nil
            lastLocation = nil
            
            locationManager.startUpdatingLocation()
        }else{
            print("Stopped")
            locationManager.stopUpdatingLocation()
        }
        
    }
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
            distanceLabel.text = "\(trimmedDistance) m"
            //distanceLabel.text = "\(distanceTraveled) m"
        }
        
        lastLocation = locations.last as CLLocation!
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
    // Healthkit Access Object
//    let healthkitStore:HealthkitStore = HKHealthStore()



}


