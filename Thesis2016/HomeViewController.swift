//
//  HomeViewController.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 16/01/2017.
//  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, ORKTaskViewControllerDelegate, CLLocationManagerDelegate {
    
    let healthManager:HealthManager = HealthManager()
    
    //http://www.appcoda.com/healthkit-introduction/
    var zeroTime = TimeInterval()
    var timer : Timer = Timer()
    
    let locationManager = CLLocationManager()
    var startLocation: CLLocation!
    var lastLocation: CLLocation!
    var distanceTraveled = 0.0
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
        
        // Do any additional setup after loading the view, typically from a nib.
        
        startButton.setTitle("Start", for: .normal)
        
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
    
    @IBAction func consentTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
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
        let taskViewController = ORKTaskViewController(task: PhysicalFunctioningTask, taskRun: nil)
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


