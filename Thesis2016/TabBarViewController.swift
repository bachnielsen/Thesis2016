//
//  TabBarViewController.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 14/01/2017.
//  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
//

import UIKit
import CareKit
import ResearchKit



class TabBarViewController: UITabBarController {
    fileprivate let carePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    
//    fileprivate var careCardViewController: OCKCareCardViewController!

//    
//    let viewController = OCKCareCardViewController(carePlanStore: carePlanStoreManager.store)
//    viewController.maskImage = UIImage(named: "heart")
//    viewController.smallMaskImage = UIImage(named: "small-heart")
//    viewController.maskImageTintColor = UIColor.darkGreen()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let careCardStack = createCareCardStack()
//        let symptomTrackerStack = createSymptomTrackerStack()
//        let insightsStack = createInsightsStack()
//        let connectStack = createConnectStack()
        
        self.viewControllers = [careCardStack]
//            ,
//                                symptomTrackerStack,
//                                insightsStack,
//                                connectStack]
        
//        tabBar.tintColor = UIColor.darkOrange()
//        tabBar.barTintColor = UIColor.lightGreen()
    }

    fileprivate func createCareCardStack() -> UINavigationController {
    }
    
    fileprivate func createCareCardStack() -> UINavigationController {
        let viewController = OCKCareCardViewController(carePlanStore: carePlanStoreManager.store)
        viewController.maskImage = UIImage(named: "heart")
        viewController.smallMaskImage = UIImage(named: "small-heart")
        viewController.maskImageTintColor = UIColor.darkRed
        viewController.tabBarItem = UITabBarItem(title: "Zombie Training", image: UIImage(named: "carekit"), selectedImage: UIImage(named: "carekit"))
        viewController.title = "CareKit"
        
        return UINavigationController(rootViewController: viewController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
