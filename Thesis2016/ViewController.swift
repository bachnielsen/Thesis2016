//
//  ViewController.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 01/11/2016.
//  Copyright © 2016 Niclas Bach Nielsen. All rights reserved.
//

import UIKit
import ResearchKit


class ViewController: UIViewController, ORKTaskViewControllerDelegate, CLLocationManagerDelegate {

    let healthManager:HealthManager = HealthManager()
    
    //http://www.appcoda.com/healthkit-introduction/
    var zeroTime = TimeInterval()
    var timer : Timer = Timer()
    
    let locationManager = CLLocationManager()
    var startLocation: CLLocation!
    var lastLocation: CLLocation!
    var distanceTraveled = 0.0
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
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
    
    @IBAction func consentTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }

//    @IBAction func bodilyPainTapped2(sender : AnyObject) {
//        let viewController = ORKTaskViewController(task: BodilyPainTask, taskRun: nil)
//        viewController.delegate = self
//        present(viewController, animated: true, completion: nil)
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
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
    // Healthkit Access Object
//    let healthkitStore:HealthkitStore = HKHealthStore()



}


