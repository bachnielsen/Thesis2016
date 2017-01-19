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



class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    fileprivate let carePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    
    fileprivate let carePlanData: CarePlanData
    
    fileprivate var careCardViewController: OCKCareCardViewController!
    
    fileprivate var connectViewController: OCKConnectViewController!
    
    let navigationBarAppearance = UINavigationBar.appearance()

    
//    fileprivate var careCardViewController: OCKCareCardViewController!

//    
//    let viewController = OCKCareCardViewController(carePlanStore: carePlanStoreManager.store)
//    viewController.maskImage = UIImage(named: "heart")
//    viewController.smallMaskImage = UIImage(named: "small-heart")
//    viewController.maskImageTintColor = UIColor.darkGreen()
    
    required init?(coder aDecoder: NSCoder) {
        carePlanData = CarePlanData(carePlanStore: carePlanStoreManager.store)
        
        super.init(coder: aDecoder)
        
//        self.navigationBarAppearance.barTintColor = UIColor.red
        let careCardViewController = createCareCardStack()
        let connectViewController = createConnectStack()
        let homeViewController = createHomeStack()
//        let symptomTrackerStack = createSymptomTrackerStack()
//        let insightsStack = createInsightsStack()
        
        
        self.viewControllers = [
            UINavigationController(rootViewController: careCardViewController),
            homeViewController,
            UINavigationController(rootViewController: connectViewController)
        ]
        
//        carePlanStoreManager.delegate = self
        
//            UINavigationController(rootViewController: createHomeViewController()),
//            UINavigationController(rootViewController: createInsightsViewController()),
//            
//            UINavigationController(rootViewController: createContactsViewController())
//        ]

        
//        tabBar.tintColor = UIColor.darkOrange()
//        tabBar.barTintColor = UIColor.lightGreen()
    }

//    fileprivate func createInsightsViewController() -> UINavigationController {
//        let viewController = OCKInsightsViewController(insightItems: carePlanStoreManager.insights, headerTitle: "Chart Placeholder", headerSubtitle: "")
//    }
    

//    fileprivate func createHomeViewController() -> OCKCareCardViewController {
//        let viewController = OCKCareCardViewController(carePlanStore: carePlanStoreManager.store)
//        viewController.maskImage = UIImage(named: "heart")
//        viewController.smallMaskImage = UIImage(named: "small-heart")
//        //viewController.maskImageTintColor = UIColor.red
//        viewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
//        viewController.title = "Home"
//        
//        return viewController
//    }
//    
//    fileprivate func createInsightsViewController() -> OCKCareCardViewController {
//        let viewController = OCKCareCardViewController(carePlanStore: carePlanStoreManager.store)
//        viewController.maskImage = UIImage(named: "heart")
//        viewController.smallMaskImage = UIImage(named: "small-heart")
//        //viewController.maskImageTintColor = UIColor.blue
//        viewController.tabBarItem = UITabBarItem(title: "Insights", image: UIImage(named: "insights"), selectedImage: UIImage(named: "insights-filled"))
//        viewController.title = "Insights"
//        
//        return viewController
//    }
//    
    
    fileprivate func createCareCardStack() -> OCKCareCardViewController {
        let viewController = OCKCareCardViewController(carePlanStore: carePlanStoreManager.store)
        
        viewController.title = NSLocalizedString("Care Card", comment: "")
        viewController.tabBarItem = UITabBarItem(title: viewController.title, image: UIImage(named:"carecard"), selectedImage: UIImage(named: "carecard-filled"))
        
        return viewController
        
        //viewController.maskImage = UIImage(named: "heart")
        //viewController.smallMaskImage = UIImage(named: "small-heart")
        //viewController.maskImageTintColor = UIColor.red
        
//        self.navigationBarAppearace.tintColor = nil
//        self.navigationBarAppearace.barTintColor = nil
//        
//        self.navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        //return UINavigationController(rootViewController: viewController)
    }
    fileprivate func createHomeStack() -> UINavigationController { //UINavigationController {// //
//        let viewController:ViewController = ViewController() //= UIViewController(coder: aDecoder) //UIViewController(nibName: ViewController, bundle: nil)//ViewController()//OCKConnectViewController(contacts: carePlanData.contacts)
        //        viewController.delegate = self
        
//        let viewController: ViewController = UIViewController(nibName: "ViewController", bundle: nil) as! ViewController
        let viewController: ViewController = ViewController(nibName: "ViewController", bundle: nil)
        
        viewController.title = NSLocalizedString("Home", comment: "")
        viewController.tabBarItem = UITabBarItem(title: viewController.title, image: UIImage(named:"home"), selectedImage: UIImage(named: "home"))
        
//        let controller = viewController.instantiateViewController(withIdentifier: "someViewController")
        self.present(viewController, animated: true, completion: nil)
//        return viewController
        return UINavigationController(rootViewController: viewController)
    }

    fileprivate func createConnectStack() -> OCKConnectViewController { //UINavigationController {// //
        let viewController = OCKConnectViewController(contacts: carePlanData.contacts)
//        viewController.delegate = self
        
        viewController.title = NSLocalizedString("Connect", comment: "")
        viewController.tabBarItem = UITabBarItem(title: viewController.title, image: UIImage(named:"connect"), selectedImage: UIImage(named: "connect-filled"))
        
        return viewController
//        return UINavigationController(rootViewController: viewController)
    }

//    fileprivate func createContactsViewController() -> OCKCareCardViewController {
//        let viewController = OCKCareCardViewController(carePlanStore: carePlanStoreManager.store)
//        viewController.maskImage = UIImage(named: "heart")
//        viewController.smallMaskImage = UIImage(named: "small-heart")
//        //viewController.maskImageTintColor = UIColor.red
//        viewController.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(named: "connect"), selectedImage: UIImage(named: "connect-filled"))
//        viewController.title = "Contacts"
//        
//        return viewController
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

// MARK: OCKConnectViewControllerDelegate

extension TabBarViewController: OCKConnectViewControllerDelegate {
    
    /// Called when the user taps a contact in the `OCKConnectViewController`.
    func connectViewController(_ connectViewController: OCKConnectViewController, didSelectShareButtonFor contact: OCKContact, presentationSourceView sourceView: UIView?) {
        let document = carePlanData.generateSampleDocument()
        let activityViewController = UIActivityViewController(activityItems: [document], applicationActivities: nil)
        
        present(activityViewController, animated: true, completion: nil)
    }
}

//// MARK: CarePlanStoreManagerDelegate
//
//extension RootViewController: CarePlanStoreManagerDelegate {
//    
//    /// Called when the `CarePlanStoreManager`'s insights are updated.
//    func carePlanStoreManager(_ manager: CarePlanStoreManager, didUpdateInsights insights: [OCKInsightItem]) {
//        // Update the insights view controller with the new insights.
//        insightsViewController.items = insights
//    }
//}
