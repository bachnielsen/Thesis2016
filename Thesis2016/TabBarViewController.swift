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
        
//        let careCardStack = createCareCardStack()
//        let symptomTrackerStack = createSymptomTrackerStack()
//        let insightsStack = createInsightsStack()
//        let connectStack = createConnectStack()
        
        self.viewControllers = [
            UINavigationController(rootViewController: createHomeViewController()),
            UINavigationController(rootViewController: createInsightsViewController()),
            UINavigationController(rootViewController: createCareCardStack()),
            UINavigationController(rootViewController: createContactsViewController())
        ]

        
//        tabBar.tintColor = UIColor.darkOrange()
//        tabBar.barTintColor = UIColor.lightGreen()
    }

//    fileprivate func createInsightsViewController() -> UINavigationController {
//        let viewController = OCKInsightsViewController(insightItems: carePlanStoreManager.insights, headerTitle: "Chart Placeholder", headerSubtitle: "")
//    }
    fileprivate func createHomeViewController() -> OCKCareCardViewController {
        let viewController = OCKCareCardViewController(carePlanStore: carePlanStoreManager.store)
        viewController.maskImage = UIImage(named: "heart")
        viewController.smallMaskImage = UIImage(named: "small-heart")
        //viewController.maskImageTintColor = UIColor.red
        viewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        viewController.title = "Home"
        
        return viewController
    }
    
    fileprivate func createInsightsViewController() -> OCKCareCardViewController {
        let viewController = OCKCareCardViewController(carePlanStore: carePlanStoreManager.store)
        viewController.maskImage = UIImage(named: "heart")
        viewController.smallMaskImage = UIImage(named: "small-heart")
        //viewController.maskImageTintColor = UIColor.red
        viewController.tabBarItem = UITabBarItem(title: "Insights", image: UIImage(named: "insights"), selectedImage: UIImage(named: "insights-filled"))
        viewController.title = "Insights"
        
        return viewController
    }
    
    
    fileprivate func createCareCardStack() -> OCKCareCardViewController {
        let viewController = OCKCareCardViewController(carePlanStore: carePlanStoreManager.store)
        viewController.maskImage = UIImage(named: "heart")
        viewController.smallMaskImage = UIImage(named: "small-heart")
        //viewController.maskImageTintColor = UIColor.red
        viewController.tabBarItem = UITabBarItem(title: "Care Card", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard-filled"))
        viewController.title = "Care Card"
        
        return viewController
        //return UINavigationController(rootViewController: viewController)
    }
    
    fileprivate func createContactsViewController() -> OCKCareCardViewController {
        let viewController = OCKCareCardViewController(carePlanStore: carePlanStoreManager.store)
        viewController.maskImage = UIImage(named: "heart")
        viewController.smallMaskImage = UIImage(named: "small-heart")
        //viewController.maskImageTintColor = UIColor.red
        viewController.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(named: "connect"), selectedImage: UIImage(named: "connect-filled"))
        viewController.title = "Contacts"
        
        return viewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
