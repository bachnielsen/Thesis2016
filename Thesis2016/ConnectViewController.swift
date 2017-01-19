////
////  ConnectViewController.swift
////  Thesis2016
////
////  Created by Niclas Bach Nielsen on 19/01/2017.
////  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
////
//
//import UIKit
//import CareKit
//import ResearchKit
//
//class ConnectViewController: UIViewController {
//    fileprivate let carePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
//    fileprivate let carePlanData: CarePlanData
//    
//    required init?(coder aDecoder: NSCoder) {
//        carePlanData = CarePlanData(carePlanStore: carePlanStoreManager.store)
//        
//        super.init(coder: aDecoder)
//
//        self.viewControllers = [UINavigationController(rootViewController: createConnectStack())]
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//    
//    fileprivate func createConnectStack() -> UINavigationController {
//        let viewController = OCKConnectViewController(contacts: carePlanData.contacts)
//        viewController.delegate = self
//        
//        viewController.tabBarItem = UITabBarItem(title: "Connect", image: UIImage(named: "connect"), selectedImage: UIImage.init(named: "connect-filled"))
//        viewController.title = "Connect"
//        return UINavigationController(rootViewController: viewController)
//    }
//}
